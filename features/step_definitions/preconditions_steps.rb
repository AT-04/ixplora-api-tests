Given(/^I register a new "(user|editor)"/) do |user_type|
  user_name = Faker::Name.name #=> "Christophe Bar tell"
  user_email = Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

  steps %(
   Given I perform "POST" request to "/users"
    When  I set and store the following "user_request" body
    """
    {
     "_id": "",
     "name": "#{user_name}",
     "primaryEmail": "#{user_email}",
     "password": "secretixplora",
     "birthDate": "2001-01-01T00:00:00.000Z",
     "secondaryEmails": [],
     "validated": false,
     "country": "Bolivia",
     "city": "Cochabamba",
     "gender": "Male",
     "role": "#{user_type}"
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "user_response"
  )
end

And(/^I validate email$/) do
  steps '
    And I perform a query using "{user_response._id}" to the "email_tokens" document
    And I store the "token" of query result as "mail_token"
    And I perform "POST" request to "/tokens"
    And I set the following custom body:
      | token | mail_token |
    And I send the request
    Then I expect a "200" status code
  '
end

And(/^I login and get token$/) do
  steps '
    And I perform "POST" request to "/users/login"
    And I set the following custom body:
      | email    | {user_response.primaryEmail}     |
      | password | {user_request.password}          |
      | type     | 0                                |
      | app      | MOBILE_APP                       |
    And I send the request
    Then I expect a "200" status code
    And I store the response body as "login_response"
  '
end

When(/^I create a survey$/) do
  steps '
    And I perform "POST" request to "/surveys"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When  I set and store the following "survey_request" body
    """
    {
     "audience": 0, "creationDate": "2017-09-29T23:24:54.255Z", "description": "Desc.", "domains": [],
     "expirationDate": "2017-10-06T23:24:54.255Z", "questions": [], "releaseDate": "2017-09-29T23:24:54.255Z",
     "responseQuantity": 0,"state": 0, "title": "Test Survey", "_id": ""
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "survey_response"
    And I perform "PUT" request to "/surveys/{survey_response._id}/state"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When  I set and store the following "survey_request" body
    """
    {
     "state": "1"
    }
    """
    And I send the request
    Then I expect a "200" status code
  '
end
