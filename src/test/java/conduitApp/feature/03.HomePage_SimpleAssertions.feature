Feature: Conduit Application Home Page API Test

		Background: Define URL
				Given url 'https://conduit.productionready.io/api/'

   	@regression
    Scenario: GET All Tags from Conduit Application Home Page using Path and URL
        Given path 'tags'
        And header Content-Type = 'application/json'
        When method GET
        Then status 200
        And print '<<=== Response ===>>',response
        And match response.tags contains 'dragons'
        And match response.tags contains ['HITLER','dragons']
        And match response.tags !contains 'Sarjerao'
        And match response.tags == "#array"
        And match response.tags != "#string"
        And match each response.tags == "#string"
        

    Scenario: Get first 10 Articles from Conduit Application Home Page using Param 
        Given path 'articles'
        And param limit = 10
        And param offset = 0
        When method GET
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 500

