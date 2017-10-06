# This utility class will store data to be reused in the Step definitions.
class Helper
  def self.initialize
    @data = {}
  end

  def self.clear_data
    @data.clear
  end

  def self.add_data(type, body)
    @data.store(type, body)
  end

  def self.get_stored_value(type)
    @data[type]
  end

  def self.get_stored_field(type, field)
    @data[type][field]
  end

  def self.obtain_data
    @data
  end
end
