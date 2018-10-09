require "Rdownloader/version"
require 'open-uri'
require "uri"
require 'pry'
require 'net/http'
require 'ruby-progressbar'
require 'securerandom'

module Rdownloader
  def self.download(path_origin)
    a = URI.escape(path_origin)
    uri = URI.parse(a)
    path_parsed = uri
    redirect_url = Net::HTTP.get_response(path_parsed)['location']
    path = redirect_url #string
    path = path_origin if path.nil?
    filenamevar1 = "#{SecureRandom.hex(2)}" #適当なファイル名
    extension = path_origin.split(".")
    filenamevar2 = ".#{extension.last}"
    @@fileName = "#{filenamevar1}" + "#{filenamevar2}" #ここはスクレイピングする
    binding.pry
    new_url = URI.encode(path) #string
    new_url_fileName = URI.decode(path).force_encoding('UTF-8')
    content_length = nil
    progress_bar = nil
      open(@@fileName, 'wb') do |output|
        p "ダウンロード中..."
        open(new_url,
          :content_length_proc => lambda{ |content_length| 
            if content_length
              # プログレスバーの最大長にcontent-lengthを指定
              progress_bar = ProgressBar.create(:total => content_length)
            end
          },
          :progress_proc => lambda{ |transferred_bytes|
            if progress_bar
              # プログレスバーの進捗状況にこれまで転送されたバイト数を代入する
              progress_bar.progress = transferred_bytes
            else
              puts "#{transferred_bytes} / Total size is unknown"
            end
          }
        ) do |data|
          output.write(data.read)
        end
    end
  end

  # class pdfDownload
    
  # end
  #Download.download('https://shugo.net/tmp/metaprogramming.pdf')
    
  #     system("gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=output.pdf #{@fileName}") 
  #     #上記入力ファイル名が取れないとsh: 1: Syntax error: "(" unexpected　のエラーになる。
  #     #9/29...memo...outputは生成される
  #     abc = "9/29.pdf"
  #     system("mv output.pdf #{abc}")#ここがうまくいかない
  # end
end
