# Turn off debug-mode
Mongo::Logger.logger.level = Logger::WARN

# Class for MongoDB connection and query manager
module MongoDBConnection
  include Mongo

  def self.initialize
    start_connection
  end

  def self.start_connection
    client_host = ["#{$mongodb_host}:#{$mongodb_port}"]
    client_options = { database: $mongodb_db_name,
                       user: $mongodb_username,
                       password: $mongodb_password }
    @client = Mongo::Client.new(client_host, client_options)
  end

  def self.close_connection
    @client.close
  end

  def self.find_document_by_field(field, value, collection, object_id = false)
    result = {}
    value = BSON::ObjectId(value) if object_id
    @client[collection.to_sym].find(field.to_sym => value).each do |data|
      result = data
    end
    result
  end

  def self.delete_document(field, value, collection, object_id = false)
    value = BSON::ObjectId(value) if object_id
    @client[collection.to_sym].find(field.to_sym => value).delete_many
  end

  def self.collections
    @client.database.collection_names
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

  def self.delete_in_collections(body)
    MongoDBConnection.collections.each do |collection|
      field = '_id'
      value = body['_id']
      object_id = false
      case collection
      when 'email_tokens'
        field = 'userId'
      when 'session_tokens'
        field = 'id'
      when 'surveys'
        field = 'owner'
      else
        object_id = true
      end
      MongoDBConnection.delete_document(field, value, collection, object_id)
    end
  end
end
