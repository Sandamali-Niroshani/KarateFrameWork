Feature: Put request behaviour

  Background:
    * url 'https://gorest.co.in/public/v2/users'
    * def payload =
    """
    {
    status:"active"
    }
    """

Scenario: Update user James status
Given path 795442
And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
And request  payload
When method PUT
Then status 200
Then match $.id == '#present'
Then match $.name == '#present'
Then match $.status == 'active'