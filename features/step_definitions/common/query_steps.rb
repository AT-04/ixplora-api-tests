And(/^I perform a query using "([^"]*)" to the "([a-z_]*)" document$/) do |param, document|
  user_id = CommonActions.built_data(param)
  @query_result = MongoDBConnection.find_by_user_id(user_id, document)
end

And(/^I store the "([^"]*)" of query result as "([^"]*)"$/) do |field, key|
  Helper.add_data(key, @query_result[field])
end
