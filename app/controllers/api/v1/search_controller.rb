require 'rest-client'
require 'json'

class Api::V1::SearchController < ApplicationController
  # before_action :set_stock, only: [:show, :update, :destroy]

  def stocks
    query = params[:id].upcase
    page = 1
    url = "https://api.intrinio.com/companies?query=#{query}&page_number=#{page}"

    results = []
    ticker_counter = 0
    name_counter = 0
    exact_match = false

    until ticker_counter == 3 && name_counter == 2 && exact_match

      response = api_call(url)
      response_data = response['data']

      i = 0
      until i == response_data.length
        ticker = response_data[i]["ticker"].upcase.strip

        if ticker[0,query.length].upcase == query && ticker_counter < 3
          results << {"title": ticker, "description": response_data[i]["name"]}
          ticker_counter += 1
        end

        if ticker == query && ticker.length == query.length && !exact_match
          results.unshift({"title": ticker, "description": response_data[i]["name"]})
          exact_match = true
        end

        if response_data[i]["name"][0,query.length].upcase == query && name_counter < 2
          results << {"title": ticker, "description": response_data[i]["name"]}
          name_counter += 1
        end

        i+=1
      end

      page += 1
      break if page > response['total_pages']
    end

    api_response = { "query": query, data: { name: "stocks", "results": results.uniq } }
    render json: api_response
  end

  def users
    query = params[:id].downcase
    results = []
    i = 0

    until i == User.all.length
      user_full_name = "#{User.all[i].first_name} #{User.all[i].last_name}"
      username = User.all[i].username

      if user_full_name[0,query.length].downcase == query
        results << {"title": user_full_name, "description": username}
      end

      if username[0,query.length].downcase == query
        results << {"title": user_full_name, "description": username}
      end

      i+=1
      break if results.length == 5
    end

    query = query.upcase

    api_response = { "query": query, data: { name: "users", "results": results.uniq[0..4] } }
    render json: api_response
  end

  private

end
