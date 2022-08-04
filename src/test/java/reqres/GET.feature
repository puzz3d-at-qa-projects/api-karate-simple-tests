Feature: GET API Test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Test third user (GET)
    Given path '/users/3'
    #Given path '/users?page=2'
    #And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data.id == 3
    And match response.data.avatar != null
    And match response.data contains { email: emma.wong@reqres.in, first_name: Emma, last_name: Wong }

  Scenario: Test out of range user ID (GET)
    Given path '/users/13'
    #Given path '/users?page=2'
    #And param page = 2
    When method GET
    Then status 404

  Scenario: Test second page (GET)
    Given path '/users'
    #Given path '/users?page=2'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].id == 7
    And assert response.data.length == 6
    And match response.data[0] contains { first_name: Michael, last_name: Lawson }
