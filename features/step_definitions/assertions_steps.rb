Then(/^I verify response with the following data$/) do |table|
  data = table.rows_hash
  expected_response = Helper.get_stored_value(data['expected_result'])
  actual_response = Helper.get_stored_value(data['actual_result'])
  expected_response.to_json.should be_json_eql(actual_response.to_json).excluding('password', '_id')
end

Then(/^I verify in MongoDB the field "([^"]*)" with value "([^"]*)" in the "([^"]*)"$/) do |field, val, colle|
  value = CommonActions.built_data(val)
  return true if MongoDBConnection.find_document_by_field(field, value, colle)
end

Then(/^I verify in CassandraDB the table "([^"]*)" in the column "([^"]*)" with value "([^"]*)"$/) do |table, col, val|
  return true if CassandraConnection.get_values_where(table, col, val)
end
