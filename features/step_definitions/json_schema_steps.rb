Then(/^I verify schema with "([^"]*)" template and "([^"]*)"$/) do |schema_template_name, variable_name|
  actual_response = Helper.get_stored_value(variable_name)
  schema_template = $variables_schema[schema_template_name]
  expect(JSON::Validator.validate(schema_template, actual_response.to_json)).to be true
end
