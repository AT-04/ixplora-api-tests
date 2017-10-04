# Turn off debug-mode
Mongo::Logger.logger.level = Logger::WARN

# Class for MongoDB connection and query manager
module MongoDBConnection
  include Mongo
  include Singleton

  def initialize
    start_connection
  end

  def find_by_id(id, document_name)
    result = {}
    @client[document_name.to_sym].find(_id: BSON::ObjectId(id)).each do |data|
      result = data
    end

    result
  end

  def find_by_user_id(id, document_name)
    result = {}
    @client[document_name.to_sym].find(userId: id).each do |data|
      result = data
    end
    result
  end

  def start_connection
    client_host = ["#{$mongodb_host}:#{$mongodb_port}"]
    client_options = { database: $mongodb_db_name,
                       user: $mongodb_username,
                       password: $mongodb_password }
    @client = Mongo::Client.new(client_host, client_options)
  end

  def clean_collection(collection)
    if collection != 'all'
      @client[collection.to_sym].delete_many
    else
      @client[:email_tokens].delete_many
      @client[:session_tokens].delete_many
      @client[:surveys_tokens].delete_many
      @client[:test].delete_many
      @client[:users].delete_many
    end
  end

  def delete_by_id(collection, id)
    @client[collection.to_sym].delete_one(_id: id)
  end

  def close_connection
    @client.close
  end
end
