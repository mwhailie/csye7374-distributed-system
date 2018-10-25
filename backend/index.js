const http = require("http");
const redis = require("redis");
const express = require('express');

const port = 8082;

let isRedisConnected = false;

const redisConfig = {
  //port: 8089,
  host: process.env.SERVICE_NAME,
  password: process.env.REDIS_PASSWD
};

const redisClient = redis.createClient(redisConfig);

redisClient.on("connect", () => {
  console.log(`Redis has been connected with host ${redisConfig.host}`);
  isRedisConnected = true;
});

redisClient.on("error", err => {
  console.error(err);
  isRedisConnected = false;
});

console.log(`Server starting at ${port}`);

const app = express();

app.get('/', function(request, response) {
  console.log("Received request from " + request.connection.remoteAddress);
  const ipAddress = request.connection.remoteAddress;
  console.log(ipAddress);
  if (isRedisConnected === false) {
      response.writeHead(500);
      response.end(`Couldn't connect to redis ${redisConfig.host}`);
  } else {
    redisClient.get(ipAddress, (error, result) => {
        console.log(`get result: ${result}`);
        if (error) console.error(error);
        if (!result) {
            redisClient.set(ipAddress, 1, (error, result) => {
                if (error) console.error(error);
                console.log(`set the result with ip ${ipAddress}`);
            });
        } else {
            redisClient.set(ipAddress, parseInt(result) + 1, (error, result) => {
                if (error) console.log(error);
                console.log(`now the result is ${result}`);
            })
        }
    });
    response.writeHead(200);
    response.write(JSON.stringify(process.env, null, 2));
    response.end();
  };
});

app.listen(port, () => {
  console.log('Listening on' + port);
});
