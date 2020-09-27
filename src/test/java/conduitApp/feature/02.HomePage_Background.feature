@regression
Feature: Conduit Application Home Page API Test

		Background: Define URL
				Given url 'https://conduit.productionready.io/api/'

    Scenario: GET All Tags from Conduit Application Home Page using Path and URL
        Given path 'tags'
        And header Content-Type = 'application/json'
        When method GET
        Then status 200

    Scenario: Get first 10 Articles from Conduit Application Home Page using Param 
        Given path 'articles'
        And param limit = 10
        And param offset = 0
        When method GET
        Then status 200

