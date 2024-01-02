Feature: Delete user on reqres.in
  Scenario: Delete a user
    * call read("../post/user-post-snippets.feature@Create")
    #Llama al escenario Create de otro feature
    Given url "https://reqres.in" + "/api/users/" + contactId
    When method delete
    Then status 204