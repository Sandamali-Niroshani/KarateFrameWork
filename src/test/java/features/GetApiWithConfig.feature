Feature: Get Request with config file

  Scenario: Get User Details
    * print baseUrl
    Given url baseUrl
    And path '1099'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actualName = response.name
    Then match actualName == 'Adripathi Chaturvedi'



