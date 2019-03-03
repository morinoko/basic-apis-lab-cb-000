class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    github_token = Rails.application.secrets.GITHUB_TOKEN

  end
end
