Feature: Conduit Application Create New Article using POST Request

		Background: Define URL
				Given url 'https://conduit.productionready.io/api/'

    Scenario: POST a new Article
        Given path 'users/login'
        And header Content-Type = 'application/json'
        And request {"user": {"email": "karate1@test.com","password": "Karate12345"}}
        When method POST
        Then status 200
        And print '<<=== Response ===>>',response
        * def token = response.user.token
        And print '<<=== Token ===>>',token
        
        Given header Authorization = 'Token ' + token
        And path 'articles'
        And request {"article": {"tagList": [],"title": "Test Sarjerao articles","description": "Sarjerao articles","body": "Test Sarjerao articles"}}
        When method POST
        Then status 200
        And print '<<=== Response ===>>',response
        And match response.article.title contains 'Sarjerao'
        And match response.article.author.username == 'Karate12345'