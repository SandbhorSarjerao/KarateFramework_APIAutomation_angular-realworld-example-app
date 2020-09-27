@ignore
Feature: Sign Up New User

	Background: 
		Given url apiUrl
		
	Scenario: New User Sign Up
    * def userData = {"email":"KarateUser54321@test.com","password":"123Karate123","username":"KarateUser54321"}	
	
		Given path 'users'
		And request {"user":{"email":#('Test'+userData.email),"password":"123Karate123","username":#('User'+userData.username)}}
		When method POST
		Then status 200
		
		
	Scenario: New User Sign Up
    * def userData1 = {"email":"KarateUser654321@test.com","password":"123Karate123","username":"KarateUser654321"}	
	
		Given path 'users'
		And request 
		"""
		{
			"user":{
								"email":#('Test'+userData1.email),
								"password":"123Karate123",
								"username":#('User'+userData1.username)
							}
		}
		"""
		When method POST
		Then status 200