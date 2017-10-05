# Turn off debug-mode
Mongo::Logger.logger.level = Logger::WARN

# Class for MongoDB connection and query manager
module MongoDBConnection
  include Mongo

  def self.initialize
    start_connection
  end

  def self.find_by_id(id, document_name)
    result = {}
    @client[document_name.to_sym].find(_id: BSON::ObjectId(id)).each do |data|
      result = data
    end

    result
  end

  def self.find_by_user_id(id, document_name)
    result = {}
    @client[document_name.to_sym].find(userId: id).each do |data|
      result = data
    end
    result
  end

  def self.start_connection
    client_host = ["#{$mongodb_host}:#{$mongodb_port}"]
    client_options = { database: $mongodb_db_name,
                       user: $mongodb_username,
                       password: $mongodb_password }
    @client = Mongo::Client.new(client_host, client_options)
  end

  def self.clean_collection(collection)
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

  def self.delete_by_id(collection, id)
    @client[collection.to_sym].delete_one(_id: id)
  end

  def self.close_connection
    @client.close
  end
end
