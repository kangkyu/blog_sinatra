require 'sinatra'
require 'rack-flash'

module Blog
  class App < Sinatra::Application

    enable :sessions
    use Rack::Flash

    POST_FILE = 'posts'

    get '/' do
      redirect to('/posts')
    end

    get '/posts' do
      @posts = []
      begin
        File.open(POST_FILE, 'r') do |file|
          file.readlines.each do |line|
            @posts.push(line.chomp)
          end
        end
      rescue Errno::ENOENT
      end
      erb :index
    end

    get '/posts/new' do
      erb :new
    end

    post '/posts' do
      File.open(POST_FILE, 'a') do |file|
        file.puts "#{params[:new_post]}"
      end
      flash[:notice] = "Post added"
      redirect '/posts'
    end

  end
end
