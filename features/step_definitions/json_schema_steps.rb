Then(/^I verify the "([^"]*)" schema with "([^"]*)" template$/) do |variable_name, schema_template_name|
  actual_response = Helper.get_stored_value(variable_name)
  schema_template = $variables_schema[schema_template_name]
  expect(JSON::Validator.validate(schema_template, actual_response)).to be true
end
