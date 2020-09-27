function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  
  var config = {
    apiUrl: 'https://conduit.productionready.io/api/'
  }
  
  if (env == 'dev') {
	  config.userEmail = 'karate1@test.com'
	  config.userPassword = 'Karate12345'
  } 
  if (env == 'qa') {
	  config.userEmail = 'karate@test.com'
	  config.userPassword = 'karate123'
  }

  var accessToken = karate.callSingle('classpath:helpers/LoginConduitApp.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})
  
  return config;
}