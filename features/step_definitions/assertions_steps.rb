Then(/^I verify in CassandraDB the table "([^"]*)" in the column "([^"]*)" with value "([^"]*)"$/) do |table, col, val|
  return true if CassandraConnection.get_values_where(table, col, val)
end

Then(/^I verify "([^"]*)" with built expected response$/) do |variable_name|
  expected_response = Helper.get_stored_value('expected_response')
  actual_response = Helper.get_stored_value(variable_name)
  expected_response.to_json.should be_json_eql(actual_response.to_json).excluding('password')
end

Then(/^I verify "([^"]*)" with following expected response$/) do |variable_name, json|
  expected_response = Helper.get_stored_value(variable_name)
  expected_response.to_json.should be_json_eql(json.to_json).excluding('password', '_id')
end

Then(/^I verify that "([^"]*)" is persisted in MongoDB as "([^"]*)"$/) do |response_name, query_result|
  expected_res = Helper.get_stored_value(query_result)
  expected_res = expected_res.first if expected_res.size == 1
  actual_res = Helper.get_stored_value(response_name)
  expected_res.to_json.should be_json_eql(actual_res.to_json).excluding('password', '_id', 'creationDate',
                                                                        'expirationDate', 'releaseDate', 'birthDate')
end
