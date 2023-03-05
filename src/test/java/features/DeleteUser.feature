Feature: Delete user API
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

    Scenario: Delete created user scenario
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
      * def userId = response.id
      * print userId

      #Delete user
      Given url 'https://gorest.co.in/public/v2/users'
      Given header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
      And path userId
      When method DELETE
      Then status 204
      Then match response == {}
      * print response

      #GET deleted user
  Given url 'https://gorest.co.in/public/v2/users'
  And path userId
      And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
      When method GET
      Then status 404
      Then match response.message == 'Resource not found'
      * print response
