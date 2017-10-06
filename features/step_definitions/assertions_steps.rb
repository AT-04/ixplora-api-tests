Then(/^I verify response with the following data$/) do |table|
  data = table.rows_hash
  expected_response = Helper.get_stored_value(data['expected_result'])
  actual_response = Helper.get_stored_value(data['actual_result'])
  expected_response.to_json.should be_json_eql(actual_response.to_json).excluding('password', '_id')
end
