require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/database.db")

class Web_User
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :password, String
  property :permissions, Digest


end

DataMapper.finalize()