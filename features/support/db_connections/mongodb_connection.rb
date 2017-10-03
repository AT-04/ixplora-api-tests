require 'bson'
require 'mongo'
require 'singleton'

# Class for MongoDB connection and query manager
class MongoDBConnection
  include Mongo
  include Singleton

  def initialize
    start_connection
  end

  def find_by_id(id, document_name)
    @client[document_name.to_sym].find(_id: BSON::ObjectId(id))
  end

  def start_connection
    @client = Mongo::Client.new(['10.28.130.4:27017'], database: 'ixplora')
  end

  def close_connection
    @client.close
  end
end

mongo = MongoDBConnection.instance
p mongo.find_by_id('59cfc79b5641d906f70bdaf8', 'user')
