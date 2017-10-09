require 'bson'
require 'mongo'
require 'singleton'
require 'cassandra'
require 'json'
require 'json-schema'
require 'json_spec'
require 'json_spec/cucumber'
require 'yaml'
require 'pathname'
require 'faker'

require_relative './env_files/load_global_variables.rb'
require_relative './schema_files/load_schema_variables.rb'
require_relative './utils/helper'
require_relative './db_connections/cassandra_connection'
require_relative './db_connections/mongodb_connection'

Helper.initialize
CassandraConnection.initialize
MongoDBConnection.initialize
