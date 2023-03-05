Feature: Json testing feature
  Scenario: Read json scenario

    * def jsonObject =
    """
    [
    {
    name : 'Sandamali',
    age : 25
  }

   {
    name : 'Sandun',
    age : 30
  }
    ]
  """

    * print jsonObject
    * print jsonObject[0].name
    * print jsonObject[1].name +" "+jsonObject[1].age

