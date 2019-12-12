
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  # end

  get '/articles' do
    @articles = Article.all
    erb :index 
  end

  #  CREATE, part 1
  get '/articles/new' do
    erb :new
  end
  
  # CREATE, part 2
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    article = Article.find(params[:id])
    article.update(params[:article])
    redirect to "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.delete
    redirect to '/articles'
  end
end
