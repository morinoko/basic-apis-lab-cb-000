class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = Rails.application.secrets.github_client_id
    client_secret = Rails.application.secrets.github_client_secret

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = params[:query]
        req.options.timeout = 0
      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @repositories = body['items']
      else
        @error = body['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again"
    end

    render :search
  end
end
