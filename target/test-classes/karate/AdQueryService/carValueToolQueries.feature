
@AdQueryService
@adService

Feature: This file contains all tests related to car value tool queries
  Background:
    Given url adQueryServiceBaseUrl



  Scenario: car value tool queries by price

    Given path 'api/v1/ads/stats/price'
    When method GET
    Then status 200
    And match response.total == '#notnull'
    And match response.min == '#notnull'
    And match response.max == '#notnull'
    And match response.avg == '#notnull'


  Scenario: car value tool queries by price and other filters

    Given path 'api/v1/ads/stats/price'
    And request read('classpath:karate/AdQueryService/input_carValueToolQueries.json')
    When method GET
    Then status 200
    And match response.total == '#notnull'
    And match response.min == '#notnull'
    And match response.max == '#notnull'
    And match response.avg == '#notnull'
