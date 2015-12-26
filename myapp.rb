require 'sinatra'

module Blog
  class App < Sinatra::Application

    get '/' do
      redirect to('/posts')
    end

    get '/posts' do
      erb :index
    end

    get '/posts/:id' do
      params[:id]
    end

  end
end
