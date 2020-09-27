@ignore
Feature: Conduit Application Create and Delete a Article API Test

		Background:
			Given url 'https://conduit.productionready.io/api/'
			
		# LOGIN User to Conduit Application	
		Scenario:
				Given path 'users/login'
        And header Content-Type = 'application/json'
        And request {"user": {"email": "karate1@test.com","password": "Karate12345"}}
        When method POST
        Then status 200
        * def token = response.user.token
        And print '<<=== User is Able to Login with Token ===>',token
    
    		# CREATE New Article using POST method            
        Given header Authorization = 'Token ' + token
        And path 'articles'
        And request {"article": {"tagList": [],"title": "Test Sarjerao Delete article","description": "Sarjerao articles","body": "Test Sarjerao articles"}}
        When method POST
        Then status 200
        * def articleId = response.article.slug
        And print '<<=== New Article is Created with articleId ===>',articleId
        
        # New Article is Created is verified using GET method
        Given path 'articles'
        And params {limit: 10, offset: 0}
        When method GET
        Then status 200
        And match response.articles[0].title == 'Test Sarjerao Delete article'
        And print '<<=== New Article is Created with Title ===>',response.articles[0].title
       
        # DELETE Article using DELETE method
       	Given header Authorization = 'Token ' + token
       	And path 'articles',articleId
       	When method DELETE
       	Then status 200
       	And print '<<=== Article is DELETED with articleId ===>',articleId
       	
       	# Article is Deleted is verified using GET method
       	Given path 'articles'
        And params {limit: 10, offset: 0}
        When method GET
        Then status 200
        And match response.articles[0].title != 'Test Sarjerao Delete article'
        And print '<<=== Article does NOT exist with Title "Test Sarjerao Delete article"===>'