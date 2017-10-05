#Feature: Surveys
#
#  Background:
#    Given I perform "POST" request to "/users"
#    When  I set and store the following "user_request" body
#    """
#    {
#     "_id": "",
#     "name": "user02",
#     "primaryEmail": "user02@mail.com",
#     "password": "secretixplora",
#     "birthDate": "2001-01-01T00:00:00.000Z",
#     "secondaryEmails": [],
#     "validated": false,
#     "country": "Bolivia",
#     "city": "Cochabamba",
#     "gender": "Male",
#     "role": "user"
#    }
#    """
#    And I send the request
#    Then I expect a "201" status code
#    And I store the response body as "user_response"
#
#  Scenario: Get a user by Id
#    Given I perform "GET" request to "/users/{user_response._id}"
#    When I send the request
#    Then I expect a "200" status code
