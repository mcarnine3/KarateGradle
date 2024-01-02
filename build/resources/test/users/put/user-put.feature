Feature: Put user on reqres.in
  Scenario: Put a user
    Given url "https://reqres.in" + "/api/users/" + "2"
    And request {"name": "jeff","job": "zion resident"}
    When method put
    Then status 200
    And match $.name == 'jeff'