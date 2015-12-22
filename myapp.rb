require 'sinatra'

get '/' do
  redirect to('/posts')
end

get '/posts' do
  erb :index
end

get '/posts/:id' do
  params[:id]
end
