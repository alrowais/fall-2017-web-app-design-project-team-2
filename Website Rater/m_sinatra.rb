require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'zip'
require 'rubygems'
require 'fileutils'


set :public_folder, 'view'
@files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
get '/' do
  @files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end



get '/Home' do
  @files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Members' do
  @files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :members
  else
    erb :signin
  end
end

get '/Analytics' do
  @files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :analytics
  else
    erb :signin
  end
end

get '/Uploads' do
  @files = ['uploads/bootstrap/file/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :upload
  else
    erb :signin
  end
end


get '/Signin' do
  @files = ['uploads/bootstrap/file/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 1
  if(session != 0)
    @user = 1
    erb :home
  else
    erb :signin
  end
end

get '/Signout' do
  @files = ['uploads/file/bootstrap/BootStrap.html', 'uploads/file/bootstrap2/BootStrap.html', 'uploads/file/bootstrap3/BootStrap.html']
  @session = 0
  @user = 1
  erb :signin
end

post '/save_file' do
  File.open('uploads/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
  end
  file = 'uploads/' + params['file'][:filename]
  extract_zip(file, 'uploads/file')
  File.delete(file)
  FileUtils.remove_dir('uploads/__MACOSX') if File.exist?('uploads/__MACOSX')
  FileUtils.remove_dir('uploads/file/__MACOSX') if File.exist?('uploads/file/__MACOSX')
  redirect to("/")
end


get '/uploads/:folder/:subfolder/:file' do
  @folder = params[:folder]
  @subfolder = params[:subfolder]
  @file = params[:file]

  File.read("uploads/#{@folder}/#{@subfolder}/#{@file}")
end

#This code is used from https://stackoverflow.com/a/37195623
def extract_zip(file, destination)
  FileUtils.mkdir_p(destination)
  Zip::File.open(file) do |zip_file|
    zip_file.each do |f|
      fpath = File.join(destination, f.name)
      zip_file.extract(f, fpath) unless File.exist?(fpath)
    end
  end
end