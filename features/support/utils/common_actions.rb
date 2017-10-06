# This module contains common methods to be used in the step definitions.
module CommonActions
  def self.built_data(input)
    param = input[/(?<=[{])[a-zA-Z_.]+(?=[}])/]
    if param
      param = param.split('.')
      input.sub!(/(?:[{])[a-zA-Z_.]+(?:[}])/, Helper.get_stored_field(param.first, param.last))
    end
    input
  end

  def self.built_json(data)
    data.each do |key, value|
      data[key] = if value[/(?:[{])[a-zA-Z_.]+(?:[}])/]
                    CommonActions.built_data(value)
                  elsif Helper.get_stored_value(value).empty?
                    value[/[\d]+/] ? value.to_i : value
                  else
                    Helper.get_stored_value(value)
                  end
    end
  end
end