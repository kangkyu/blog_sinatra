require 'sinatra'
require 'rack-flash'

module Blog
  class App < Sinatra::Application

    enable :sessions
    use Rack::Flash

    get '/' do
      redirect to('/posts')
    end

    get '/posts' do
      @posts = ['Hello world', 'Look here']
      File.open('posts', 'r') do |file|
        file.readlines.each do |line|
          @posts.push(line.chomp)
        end
      end
      erb :index
    end

    get '/posts/new' do
      erb :new
    end

    post '/posts' do
      File.open('posts', 'a') do |file|
        file.puts "#{params[:new_post]}"
      end
      flash[:notice] = "Post added"
      redirect '/posts'
    end

  end
end
