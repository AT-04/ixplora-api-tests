# This module contains common methods to be used in the step definitions.
module CommonActions
  def self.built_endpoint(input)
    param = input[%r{(?<=\/[{])[a-zA-Z_.]+(?=[}])}]
    if param
      param = param.split('.')
      input.sub!(/(?:[{])[a-zA-Z_.]+(?:[}])/, Helper.field_from_response(param.first, param.last))
    end
    input
  end
end
