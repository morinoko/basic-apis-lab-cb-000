class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    GITHUB_TOKEN = Rails.application.secrets.GITHUB_TOKEN
    
  end
end
