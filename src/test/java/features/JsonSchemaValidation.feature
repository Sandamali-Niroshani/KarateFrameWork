Feature: Json Schema Validation
  Scenario: Schema validation scenario

    Given url 'https://reqres.in/api/users'
    And path 2
    When method GET
    Then status 200
    * print response
    Then match response == '#object'
    * def jsonSchemaExpected =
    """
    {
    "data": {
        "id": '#number',
        "email": "#string",
        "first_name": "#string",
        "last_name": "#string",
        "avatar": "#string"
    },
    "support": {
        "url": "#string",
        "text": "#string"
    }
}
    """
    Then match response == jsonSchemaExpected
    * match response.data.email contains 'janet.weaver'
    * match response.data.email == '#notnull'
