require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, 'true'
  end

  get "/" do
    binding.pry
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end
  
  post "/articles" do
    @article = Article.create(params)
    # binding.pry
    redirect to "/articles/#{@article.id}"
  end

  get "/articles/new" do
    erb :new
  end

  delete "/articles/:id" do
    binding.pry
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end

  get "/articles/:id" do
    # binding.pry
    @article = Article.find(params[:id])
    erb :show
  end
  
  patch "/articles/:id" do
    binding.pry
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end
  
  get "/articles/:id/edit" do
    # binding.pry
    @article = Article.find(params[:id])
    erb :edit
  end

end
