Feature: Get Request
  Background:
    * url 'https://gorest.co.in/public/v2/users'

  Scenario: Get User Details
    Given path '791018'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actualName = response.name
    Then match actualName == 'Adripathi Chaturvedi'

  Scenario: Get User Details - User not found
    Given path '1'
    When method GET
    Then status 404

