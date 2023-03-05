Feature: API request with Authorization token
    Background:
      * url 'https://gorest.co.in/public/v2/users'

    Scenario: Authorization Scenario
      * def token = 'dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
      Given header Authorization = 'Bearer '+token
      And path '795442'
      When method GET
      Then status 200
      * print response

