
@AdQueryService
@adService

Feature: This file contains all tests related to find ad by id
  Background:
* def authValue = call read('classpath:basic-auth.js') { username: '#(abc_authUsername)', password: '#(abc_authPassword)'}

  Scenario:find ad by id
    Given url cabBaseUrl
    Given path 'ads'
    And header Authorization = authValue
    And request read('createUsedAdInAuto.json')
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And def adId = response.id

    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(10000)

    Given url adQueryServiceBaseUrl
    Given path 'api/v1/ads', adId
    When method GET
    Then status 200
    And response.id = adId