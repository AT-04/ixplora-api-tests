Feature: create emails

  Scenario: I create a new email
    Given I perform "POST" request to "/users/{userId}/emails"
    When  I set the following body:
"""
{
    "email": "example@mail.com"
}
"""
    Then I expect a "201" status code
    And I expect the following JSON response
"""
 {
	"_id": "59d1668ffa8c480893708478",
	"name": "DemoUser02",
	"primaryEmail": "user02@mail.com",
	"password": "$2a$10$XmC0r5mKHM7Fv3z9iAYEw.D2JDzmhiNJI4znMmd5Yp/pLrXL6/7r2",
	"birthDate": "2001-01-01T00:00:00.000Z",
	"validated": true,
	"country": "Bolivia",
	"city": "Cochabamba",
	"gender": "Male",
	"role": "user",
	"__v": 0,
	"secondaryEmails": [{
		"email": "example@mail.com",
		"validated": false,
		"_id": "59d196fa943d710881bd9a87"
	}]
}
"""
    And I verify the data bases
