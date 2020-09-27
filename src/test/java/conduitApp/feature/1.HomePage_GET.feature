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

    Scenario: Get first 10 Articles from Conduit Application Home Page using Param 
        Given url 'https://conduit.productionready.io/api/articles'
        And param limit = 10
        And param offset = 0
        When method GET
        Then status 200

    Scenario: Get first 10 Articles from Conduit Application Home Page using Params
        Given url 'https://conduit.productionready.io/api/articles'
        And params {limit: 10, offset: 0}
        When method GET
        Then status 200
        
   	Scenario: GET All Tags from Conduit Application Home Page using Path and URL
        Given url 'https://conduit.productionready.io/api/'
        And path 'tags'
        And header Content-Type = 'application/json'
        When method GET
        Then status 200
        
    Scenario: Get first 10 Articles from Conduit Application Home Page using Params using Path and URL
        Given url 'https://conduit.productionready.io/api/'
        And path 'articles'
        And params {limit: 10, offset: 0}
        When method GET
        Then status 200