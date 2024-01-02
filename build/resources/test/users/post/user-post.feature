Feature: Post user on reqres.in

  Background:
    * url "https://reqres.in"
    * path "/api/users"
    #* def var = {"name": "jeff","job": "qa loco"}
    #* request {"name": "jeff","job": "qa loco"}
    * request {"name": "#(name)","job": "#(job)"}

  Scenario Outline: Post a user
    When method post
    Then status 201

    Examples:
    |name|job|
    |jeff|qa|
    |jeff 2|qa analyst|
    |jeff 3|qa lead|

  Scenario: Post a user without job
    And request {"name": "jeff"}
    When method post
    Then status 201

  Scenario: Post a user with invalid name
    And request {"name": "$%&$%","job": "qa loco"}
    When method post
    Then status 201