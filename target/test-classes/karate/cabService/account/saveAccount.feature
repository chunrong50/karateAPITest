@cab
@parallel=false
Feature: This file contains all tests related to save account
  Background:
    * def authValue = call read('classpath:basic-auth.js') { username: '#(catalyst_authUsername)', password: '#(catalyst_authPassword)'}

  @name=saveAccount
  Scenario: save a new account
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForSaveAccount')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 201
    And match response.localId == '#notnull'
    And match response.registered == false
    And match response.email contains featureHelper.salesforceId
    And match response.relations.mobileExportEnabled == 'true'
    And match response.relations.kijijiExportEnabled == 'true'
    And match response.relations.dekraEnabled == 'true'
    And match response.relations.diogeneEnabled == 'true'
    And match response.relations.concessionarioUfficiale == 'true'
    And match response.relations.callTrackingEnabled == 'true'
    * def propHelper = Java.type('utils.PropertyHelper')
    * eval propHelper.writeProperties("salesforceId", featureHelper.salesforceId)
    * eval propHelper.writeProperties("accountId", response.localId)
    * eval propHelper.writeProperties("accountExtId", featureHelper.accountExtId)

  @name=saveAccountWithOtherAttributes
  Scenario: save a new account with some other values
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForSaveAccountAttributes1')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 201
    And match response.localId == '#notnull'
    And match response.registered == false
    And match response.email contains featureHelper.salesforceId
    And match response.relations.mobileExportEnabled == 'false'
    And match response.relations.kijijiExportEnabled == 'false'
    And match response.relations.dekraEnabled == 'false'
    And match response.relations.diogeneEnabled == 'true'
    And match response.relations.concessionarioUfficiale == 'false'
    And match response.relations.callTrackingEnabled == 'false'
    * def propHelper = Java.type('utils.PropertyHelper')
    * eval propHelper.writeProperties("salesforceId", featureHelper.salesforceId)
    * eval propHelper.writeProperties("accountId", response.localId)
    * eval propHelper.writeProperties("accountExtId", featureHelper.accountExtId)


  Scenario: save an existing account
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForSaveAnExistingAccount')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 400


  Scenario: check fields validity for accountExtId, salesforceId, status, email
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForValidityAccountExtId')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 400


  Scenario: check fields validity for shipping address info
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForValidityShippingAddress')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 400


  @name=saveAccountWithGooglePlaceID
  Scenario: save a new account with GooglePlaceID
    * def featureHelper = call read('classpath:karate/cab/account/cabHelper.feature@name=dataForSaveAccountWithGooglePlaceID')
    Given url cabBaseUrl
    And path 'accounts'
    And header Authorization = authValue
    And request featureHelper.payload
    When method post
    Then status 201
    And match response.localId == '#notnull'
    And match response.registered == false
    And match response.email contains featureHelper.salesforceId
    And match response.relations.mobileExportEnabled == 'true'
    And match response.relations.diogeneEnabled == 'true'
    And match response.relations.googlePlaceId == '#string'








