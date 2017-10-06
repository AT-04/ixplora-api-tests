And(/^I run a query to filter the field "([^"]*)" with value "([^"]*)" to "([a-z_]*)"$/) do |key, val, doc|
  value = CommonActions.built_data(val)
  @query_result = MongoDBConnection.find_document_by_field(key, value, doc)
end

And(/^I store the "([^"]*)" of query result as "([^"]*)"$/) do |field, key|
  Helper.add_data(key, @query_result[field])
end