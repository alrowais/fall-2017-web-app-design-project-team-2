require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?


set :public_folder, 'view'
@files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
get '/' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end



get '/Home' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Members' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :members
  else
    erb :signin
  end
end

get '/Analytics' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :analytics
  else
    erb :signin
  end
end

get '/Uploads' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :upload
  else
    erb :signin
  end
end


get '/Signin' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Signout' do
  @files = ['uploads/bootstrap/BootStrap.html', 'uploads/bootstrap2/BootStrap.html', 'uploads/bootstrap3/BootStrap.html']
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


get '/uploads/:folder/:file' do
  @folder = params[:folder]
  @file = params[:file]

  File.read("uploads/#{@folder}/#{@file}")
end

