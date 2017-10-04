# Cassandra cluster connects to cassandra db
module CassandraConnection
  include Singleton
  def initialize
    connection_configuration
    connection
  end

  def connection_configuration
    @key_space = $cassandra_key_space
    @cluster = Cassandra.cluster(username: $cassandra_username,
                                 password: $cassandra_password,
                                 port: $cassandra_port.to_i,
                                 hosts: $cassandra_host)
  end

  def connection
    @session = @cluster.connect(@key_space)
  end

  def get_values(table_name)
    future = @session.execute_async("select * from #{@key_space}.#{table_name}")
    future.on_success do |rows|
      return rows
    end
    future.join
  end

  def get_values_where(table_name, col_name, col_value)
    future = @session.execute_async("select * from #{@key_space}.#{table_name} where #{col_name} = '#{col_value}'")
    future.on_success do |rows|
      return rows
    end
    future.join
  end
end
