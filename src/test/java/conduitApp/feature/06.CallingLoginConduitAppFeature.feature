@ignore
Feature: Calling "Login Conduit App Feature"

		Background: Define URL
				Given url 'https://conduit.productionready.io/api/'
				* def tokenResponse = callonce read('classpath:helpers/LoginConduitApp.feature')
				* def authorizationToken = tokenResponse.authToken

    Scenario: LOGIN to Conduit Application
        Given header Authorization = 'Token ' + authorizationToken
        And path 'articles'
        And request {"article": {"tagList": [],"title": "Test Sarjerao articles","description": "Sarjerao articles","body": "Test Sarjerao articles"}}
        When method POST
        Then status 200
        And print '<<=== Response ===>>',response
        And match response.article.title contains 'Sarjerao'
        And match response.article.author.username == 'Karate12345'