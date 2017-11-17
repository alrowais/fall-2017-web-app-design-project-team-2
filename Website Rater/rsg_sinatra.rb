require 'sinatra'
require 'sinatra/reloader' if development?



get '/' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end



get '/Home' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Members' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :members
  else
    erb :signin
  end
end

get '/Analytics' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :analytics
  else
    erb :signin
  end
end

get '/Uploads' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :upload
  else
    erb :signin
  end
end


get '/Signin' do
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Signout' do
  @session = 0
  @user = 1
  erb :signin
end

post '/save_file' do
  File.open('uploads/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
  end
  redirect to("/")
end


