class RepositoriesController < ApplicationController
  def index
    github = GithubService.new
    github.access_token = session[:token]
    @repos = github.get_repos
  end

  def create
    github = GithubService.new.tap{|obj| obj.access_token = session[:token]}.create_repo(params[:name])
    redirect_to '/'
  end
end
