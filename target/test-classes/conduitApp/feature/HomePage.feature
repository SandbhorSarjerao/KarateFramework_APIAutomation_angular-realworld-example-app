

Feature: Conduit Application Home Page API Test

    Scenario: GET All Tags from Conduit Application Home Page
        Given url 'https://conduit.productionready.io/api/tags'
        And header Content-Type = 'application/json'
        When method GET
        Then status 200

    Scenario: Get first 10 Articles from Conduit Application Home Page
        Given url 'https://conduit.productionready.io/api/articles?limit=10&offset=0'
        When method GET
        Then status 200