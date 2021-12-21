class SearchesController < ApplicationController
  require 'net/http'

  def search
    if postal_code = params[:postal_code]
      params = URI.encode_www_form({zipcode: postal_code})
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
      if result["results"]
        @zipcode = result["results"][0]["zipcode"]
        @address1 = result["results"][0]["address1"]
        @address2 = result["results"][0]["address2"]
        @address3 = result["results"][0]["address3"]
      end
    end
  end

  def jonson
    if num = params[:comment]
      uri = URI.parse("https://jsonplaceholder.typicode.com/comments/#{num}")
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
      @id = result["id"]
      @name = result["name"]
      @email = result["email"]
      @body = result["body"]
    end
  end

  def tvjon
    area = params[:area].split(":")
    @service = params[:service].split(":")
    date = params[:date].split(":")
    uri = URI.parse("https://api.nhk.or.jp/v2/pg/list/#{area[0]}/#{@service[0]}/#{date[0]}.json?key=#{ENV["NHK_API"]}")
    response = Net::HTTP.get_response(uri)
    @results = JSON.parse(response.body)
  end
end
