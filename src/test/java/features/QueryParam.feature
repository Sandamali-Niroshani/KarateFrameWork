Feature: API request with query params


  Scenario: Retrieve active users
    * def query = {status:'active'}
    Given url 'https://gorest.co.in/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response
    Then match response[0].status == 'active'

  Scenario: Retrieve active users scenarios2
    Given url 'https://gorest.co.in/public/v2/users'
    And param status = 'active'
    When method GET
    Then status 200
    * print response
    Then match each response[*].status == 'active'

    Scenario: Retrieve all female active users
      * def query = {status:'active',gender:'female'}
      Given url 'https://gorest.co.in/public/v2/users'
      And params query
      When method GET
      * print response
      Then match response[2].gender == 'female'
      * def userCount = response.length
      * print userCount


