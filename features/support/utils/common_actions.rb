# This module defines the
module CommonActions
  def self.built_endpoint(input)
    if input[%r{(?<=\/[{])[a-zA-Z_.]+(?=[}])}]
      param = input[%r{(?<=\/[{])[a-zA-Z_.]+(?=[}])}].split('.')
      case param.first
      when 'user'
        input.sub!(/(?:[{])[a-zA-Z_.]+(?:[}])/, Helper.instance.user[param.last])
      when 'survey'
        input.sub!(/(?:[{])[a-zA-Z_.]+(?:[}])/, Helper.instance.survey[param.last])
      end
    end
    input
  end
end
