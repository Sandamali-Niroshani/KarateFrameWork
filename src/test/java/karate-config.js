function fn(){

var config = {
env: env,
    baseUrl :'https://gorest.co.in/public/v2/users'
  };

  var env = karate.env;
//  karate.log('karate.env =', karate.env);
//  karate.log('config.baseUrl =', config.baseUrl);

return config
}

