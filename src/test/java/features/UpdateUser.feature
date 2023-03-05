Feature: Update user created by post request
Background:
  * def random_string =
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
  * def randomString = random_string(10)
  * print randomString

  Scenario: Update user created by post request scenario
    * def requestBody =
    """
    {
"name":"James Gunawardana",
"gender":"male",
"status":"active"
}
    """
    * requestBody.email=randomString+"@gmail.com";

    Given url 'https://gorest.co.in/public/v2/users'
    Given header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
    And request  requestBody
    When method POST
    Then status 201
    * print response
    Then match $.id == '#present'


    #Extract user id
  * def userId = $.id

    #Update user
    * def putPayload =
    """
    {
    status:"inactive"
    }
    """
    Given url 'https://gorest.co.in/public/v2/users'
    Given path userId
    And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
    And request  putPayload
    When method PUT
    Then status 200
    Then match $.id == '#present'
    Then match $.id == userId
    Then match $.status == 'inactive'