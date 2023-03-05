Feature: Create user


    Scenario: Create user james
      * def requestBody =
    """
    {
name:"James Gunawardana",
email:"jamesG4@gmail.com",
gender:"male",
status:"active"
}
    """
      Given url 'https://gorest.co.in/public/v1/users'
      And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
      And request  requestBody
      When method POST
      Then status 201
      Then match $.data.id == '#present'
      Then match $.data.name == '#present'
      Then match $.data.name == 'James Gunawardana'


  Scenario: Create user Tom
    * def requestBody =
    """
    {
name:"Tom Gunawardana",
email:"Tom3@gmail.com",
gender:"male",
status:"active"
}
    """
    Given url 'https://gorest.co.in/public/v2/users'
    And header Authorization = 'Bearer dc1dba1a36c805ed5f4cfde51745869b2e04ab2307b5ec109138ec5025e99ded'
    And request  requestBody
    When method POST
    Then status 201
    Then match $.id == '#present'
    Then match $.name == '#present'
    Then match $.name == 'Tom Gunawardana'