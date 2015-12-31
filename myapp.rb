require 'sinatra'

module Blog
  class App < Sinatra::Application

    get '/' do
      redirect to('/posts')
    end

    get '/posts' do
      @posts = ['Hello world', 'Look here']
      erb :index
    end

    get '/posts/new' do
      erb :new
    end

    post '/posts' do
      params[:new_post]

      redirect '/posts'
    end

  end
end
