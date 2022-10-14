Feature: This file is to help saveANewAccount feature file to store some variables
  @name=dataForSaveAccount
  Scenario: This scenario is to help 'save a new account' in save_update_account.feature
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 8'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Garibaldi, 18'
    * def billing_city = 'Roma'
    * def billing_postalCode = '00030'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def randomHelper = Java.type('utils.RandomHelper')
    * def salesforceId = randomHelper.generateRandomChars(16)
    * def accountExtId = randomHelper.generateRandomChars(10)
    * def payload = read('classpath:karate/cab/account/saveAccount.json')

  @name=dataForSaveAccountAttributes1
  Scenario: This scenario is to help 'save a new account' in save_update_account.feature
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 8'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Garibaldi, 18'
    * def billing_city = 'Roma'
    * def billing_postalCode = '00030'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def randomHelper = Java.type('utils.RandomHelper')
    * def salesforceId = randomHelper.generateRandomChars(16)
    * def accountExtId = randomHelper.generateRandomChars(10)
    * def payload = read('classpath:karate/cab/account/saveAccountAttributes1.json')


  @name=dataForSaveAnExistingAccount
  Scenario: This scenario is to help 'save an existing account' in save_update_account.feature
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 18'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Garibaldi, 8'
    * def billing_city = 'Roma'
    * def billing_postalCode = '00030'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def propHelper = Java.type('utils.PropertyHelper')
    * def salesforceId = propHelper.readValue("salesforceId")
    * def accountExtId = propHelper.readValue("accountExtId")
    * def payload = read('classpath:karate/cab/account/saveAccount.json')

  @name=dataForValidityAccountExtId
   Scenario:This scenario is to help 'check fields validity for accountExtId, salesforceId, status' in save_update_account.feature
     * def randomHelper = Java.type('utils.RandomHelper')
     * def accountExtId = randomHelper.generateRandomChars(21)
     * def salesforceId = randomHelper.generateRandomChars(19)
     * def status = ''
     * def email = ''
     * def shipping_street = 'Via Lepetit, 8'
     * def shipping_city = 'Milano'
     * def shipping_postalCode = '20124'
     * def shipping_country = 'Italia'
     * def shipping_countryCode = 'IT'
     * def billing_street = 'Via Garibaldi, 18'
     * def billing_city = 'Roma'
     * def billing_postalCode = '00030'
     * def billing_country = 'Italia'
     * def billing_countryCode = 'IT'
     * def payload = read('classpath:karate/cab/account/saveAccount.json')

  @name=dataForValidityShippingAddress
  Scenario:This scenario is to help 'check fields validity for shipping address info' in save_update_account.feature
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = ''
    * def shipping_city = ''
    * def shipping_postalCode = ''
    * def shipping_country = ''
    * def shipping_countryCode = ''
    * def billing_street = 'Via Garibaldi, 18'
    * def billing_city = 'Roma'
    * def billing_postalCode = '00030'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def randomHelper = Java.type('utils.RandomHelper')
    * def salesforceId = randomHelper.generateRandomChars(16)
    * def accountExtId = salesforceId
    * def payload = read('classpath:karate/cab/account/saveAccount.json')

  @name=dataForSaveABooking
  Scenario: This scenario is to help 'save a booking' in save_update_account.feature
    * def saveAccount = call read('classpath:karate/cab/account/saveAccount.feature@name=saveAccount')
    * def salesforceId = saveAccount.featureHelper.salesforceId
    * def accountId = saveAccount.response.localId
    * def endDate = '2020-12-30'
    * def payload = read('classpath:karate/cab/account/saveBooking.json')
    * def propHelper = Java.type('utils.PropertyHelper')
    * eval propHelper.writeProperties("accountIdForBooking", accountId)
    * eval propHelper.writeProperties("salesforceIdForBooking", salesforceId)

  @name=dataForUpdateAccount
  Scenario: This scenario is to help 'update an account' in save_update_account.feature
    * def saveAccount = call read('classpath:karate/cab/account/saveAccount.feature@name=saveAccount')
    * def salesforceId = saveAccount.featureHelper.salesforceId
    * def accountExtId = saveAccount.featureHelper.accountExtId
    * def accountId = saveAccount.response.localId
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 8'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Lepetit, 8'
    * def billing_city = 'Milano'
    * def billing_postalCode = '20124'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def payload = read('classpath:karate/cab/account/saveAccount.json')

  @name=dataForSaveAccountWithGooglePlaceID
  Scenario: This scenario is to help 'save a new account with googlePlaceID' in save_update_account.feature
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 8'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Garibaldi, 18'
    * def billing_city = 'Roma'
    * def billing_postalCode = '00030'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def randomHelper = Java.type('utils.RandomHelper')
    * def salesforceId = randomHelper.generateRandomChars(16)
    * def accountExtId = randomHelper.generateRandomChars(10)
    * def googlePlaceId = randomHelper.generateRandomChars(27)
    * def payload = read('classpath:karate/cab/account/saveAccountWithGooglePlaceID.json')

  @name=dataForUpdateAccountWithGooglePlaceID
  Scenario: This scenario is to help 'update an account' in save_update_account.feature
    * def saveAccount = call read('classpath:karate/cab/account/saveAccount.feature@name=saveAccount')
    * def salesforceId = saveAccount.featureHelper.salesforceId
    * def accountExtId = saveAccount.featureHelper.accountExtId
    * def accountId = saveAccount.response.localId
    * def status = 'ACTIVE'
    * def email = 'italyqe@ebay.com'
    * def shipping_street = 'Via Lepetit, 8'
    * def shipping_city = 'Milano'
    * def shipping_postalCode = '20124'
    * def shipping_country = 'Italia'
    * def shipping_countryCode = 'IT'
    * def billing_street = 'Via Lepetit, 8'
    * def billing_city = 'Milano'
    * def billing_postalCode = '20124'
    * def billing_country = 'Italia'
    * def billing_countryCode = 'IT'
    * def randomHelper = Java.type('utils.RandomHelper')
    * def googlePlaceId = randomHelper.generateRandomChars(27)
    * def payload = read('classpath:karate/cab/account/saveAccountWithGooglePlaceID.json')



