Feature: API request with headers

  Scenario: API request with headers Scenario 1
    Given header Content-Type = 'application/json'
    And header Accept-Encoding = 'gzip, deflate, br'
    Given url 'https://gorest.co.in/public/v2/users'
    And path 789976
    When method GET
    Then status 200
    * print response

  Scenario: API request with headers Scenario 2
    * def requestHeaders = { Content-Type : 'application/json',Accept-Encoding : 'gzip, deflate, br'}
    Given headers requestHeaders
    Given url 'https://gorest.co.in/public/v2/users'
    And path 789976
    When method GET
    Then status 200
    * print response

  Scenario: API request with headers Scenario 3
    * configure headers = { Content-Type : 'application/json',Accept-Encoding : 'gzip, deflate, br'}
    Given url 'https://gorest.co.in/public/v2/users'
    And path 789976
    When method GET
    Then status 200
    * print response



