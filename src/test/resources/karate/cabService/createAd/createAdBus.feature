@cab
@adService
@parallel=false
Feature: This file contains all tests for create ad in Bus category
  Background:
    * def authValue = call read('classpath:basic-auth.js') { username: '#(cab_authUsername)', password: '#(cab_authPassword)'}

  @name=createAdInBus
  Scenario: create new ad in Bus

    Given url cabBaseUrl
    Given path 'ads'
    And header Authorization = authValue
    And request read('createAdBus.json')
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And match response.id == '#notnull'

    And def adId = response.id

    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(10000)

    Given url cabBaseUrl
    Given path 'ads', adId
    And header Authorization = authValue
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    Then match response == read('responseCreateAdBus.json')
