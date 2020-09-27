@ignore
Feature: Conduit Application LOGIN and Create TOKEN

		Background: Define URL
				Given url apiUrl

    Scenario: LOGIN to Conduit Application and Create TOKEN
        Given path 'users/login'
        And header Content-Type = 'application/json'
        And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
        When method POST
        Then status 200
        And print '<<=== Response ===>>',response
        * def authToken = response.user.token
        And print '<<=== Authorization Token ===>>',authToken