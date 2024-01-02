@ignore
Feature: Reusable scenarios for post a user

  @Create
  Scenario:
    Given url "https://reqres.in/api/users"
    And request {"name": "Jeff","job": "Leader"}
    When method post
    Then status 201
    And def contactId = $.id
    #Guarda el id del response en la variable contactId