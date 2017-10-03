Feature: Create users

  Scenario: I create a new user
    Given I perform "PUT" request to "/users"
    When  I set the following body:
"""
{
 "_id": "",
 "name": "DemoUser02",
 "primaryEmail": "user02@mail.com",
 "password": "secretixplora",
 "birthDate": "2001-01-01T00:00:00.000Z",
 "secondaryEmails": [],
 "validated": false,
 "country": "Bolivia",
 "city": "Cochabamba",
 "gender": "Male",
 "role": "user"
}
"""
    Then I expect a '200' status code
    And I expect the following JSON response
"""
    {
    "__v": 0,
    "name": "DemoUser02",
    "primaryEmail": "user02@mail.com",
    "password": "$2a$10$XmC0r5mKHM7Fv3z9iAYEw.D2JDzmhiNJI4znMmd5Yp/pLrXL6/7r2",
    "birthDate": "2001-01-01T00:00:00.000Z",
    "validated": false,
    "country": "Bolivia",
    "city": "Cochabamba",
    "gender": "Male",
    "role": "user",
    "_id": "59d1668ffa8c480893708478",
    "secondaryEmails": []
}
"""
    And I verify the data bases
