And(/^I verify that "([^"]*)" body contains$/) do |key_name, json|
  Helper.get_stored_value(key_name).to_json.should be_json_eql(JSON.parse(json).to_json)
end
