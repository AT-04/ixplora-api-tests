Feature: Post Surveys answers
  Background:
    Given I register a new "editor"
    And I validate email
    And I login and get token
    And I perform "POST" request to "/surveys"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When  I set and store the following "survey_request" body
    """
     {
       "_id": "",
       "title": "survey01",
       "description": "description 01",
       "audience": 0,
       "domains": [],
       "state": 0,
       "releaseDate": "2017-10-05T20:41:46.835Z",
       "creationDate": "2017-10-05T20:41:46.835Z",
       "expirationDate": "2017-10-12T20:41:46.835Z",
       "responseQuantity": 0,
       "questions": [{
                        "_id": "",
                       "text": "Question01",
                       "type": "checkbox",
                       "required": false,
                       "sequence": 0,
                       "valid": true,
                       "options": [{
                                       "_id": "",
                                       "label": "option1",
                                       "default": false,
                                       "sequence": 0
                                   }, {
                                       "_id": "",
                                       "label": "option2",
                                       "default": false,
                                       "sequence": 1
                                   }]
                   }]
     }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "survey_response"

    And I perform "POST" request to "/users"
    When  I set and store the following "user_request" body
    """
    {
     "_id": "",
     "name": "Editor00",
     "primaryEmail": "editor00@mail.com",
     "password": "1234",
     "birthDate": "2001-01-01T00:00:00.000Z",
     "secondaryEmails": [],
     "validated": true,
     "country": "Bolivia",
     "city": "Cochabamba",
     "gender": "Male",
     "role": "editor"
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "user_response"



  @CRUD
  Scenario: Verify that "/surveys/{surveyId}/answers" end point can performing "POST" request.
    Given I perform "POST" request to "/surveys/{survey_response._id}/answers"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    And I set and store the following "answers_request" body
    """
    {
     "answers": [{
      "questionId": "59cfe2e95641d906f70bdb15",
      "answers": "1",
      "type": "singleSelection"
     }],
      "userId": "59cfd3df5641d906f70bdafb"
    }
    """
    When I send the request
    Then I expect a "201" status code