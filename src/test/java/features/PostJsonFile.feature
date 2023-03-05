Feature: Create user with json file

  Background:
  * def requestPayload = read('classpath:src/test/resourses/payload/user.json')
  * print requestPayload

  Scenario: Create user with json file scenario
    Given url 'https://gorest.co.in/public/v1/users'
    And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
    And request requestPayload
    When method POST
    Then status 201
    Then match response == "#object"