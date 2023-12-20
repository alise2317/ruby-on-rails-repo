
require 'net/http'
require 'nokogiri'

class Lab10Controller < ApplicationController
  include ReverseProxy::Controller

  def initialize
    @xslt = Nokogiri::XSLT(File.read('transformer.xslt'))
  end

  def index  
    reverse_proxy('http://127.0.0.1:3001/') do |config|  # работа с сервером
      config.on_success do |_code, response|   # если успешно, то
        if request.format == 'application/xml'  # если формат = application, то вернет без изменений
          response
        else # если не XML то выполняй XSLT
          res = @xslt.transform(Nokogiri::XML(response.body))
          return render html: res  # возвращает html ответ
        end
      end
    end
  end
end
