Given(/^I build the expected response with following data$/) do |table|
  data = table.rows_hash
  body_request = Helper.get_stored_value(data['request_name'])
  body_response = Helper.get_stored_value(data['response_name'])
  puts "this is RESPONSEEEE"
  puts body_response.to_json
  puts "this is RESPONSEEEE"
  template_name = data['template_name']
  json = '{}'
  response_expect_name = 'expected_response'
  expected_response = ResponseBuilder.build_response(template_name, body_request.to_json, json, body_response.to_json)
  Helper.add_data(response_expect_name, expected_response)
end
