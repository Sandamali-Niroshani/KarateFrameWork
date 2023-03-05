Feature: Create user

  Background:
    * url 'https://gorest.co.in/public/v2/users'

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

#    * def random_Number =
#	"""
#		function(s){
#			var text = "James";
#			text = text+Math.floor(Math.random() * s);
#				return text;
#		}
#	"""
#
#    * def randomStringWithNumber = random_Number(100)
#    * print randomStringWithNumber


    * def requestBody =
    """
   {
"name":"James Gunawardana",
"gender":"male",
"status":"active"
}
    """
  * requestBody.email=randomString+"@gmail.com";

  Scenario: Create user james
    Given header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
    And request  requestBody
    When method POST
    Then status 201
    * print response
    Then match $.id == '#present'
    Then match $.name == '#present'
    Then match $.name == 'James Gunawardana'
    Then match $.email == requestBody.email