
require_relative '../../config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  patch '/articles/:id' do
    @article = Article.all.find id = params["id"]
    @article.update_attributes(params.except("_method"))
    redirect to "/articles/#{Article.params[:id]}"
  end

  post '/articles' do
    @newarticle = Article.create(params)
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @thisarticle = Article.find id = params['id']
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.all.find id = params[:id]
    erb :edit
  end

  delete '/articles/:id' do
    @article = Article.find id = params['id']
    @article.destroy
    redirect to "/articles"
  end

end