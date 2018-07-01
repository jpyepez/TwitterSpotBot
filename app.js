/*jshint esversion: 6 */

const Twit = require('twit');
const config = require('./config');

console.log("TwitterBot started");
// console.log(config);

const T = new Twit(config);
//console.log(T);

newTweet();
setInterval(newTweet, 1000*20);

function newTweet() {
    let newRNG = Math.floor(Math.random()*100);

    let tweet = {status: `I just rolled a new number... It's ${newRNG}`};

    T.post('statuses/update', tweet, function(err, data, response) {
        console.log(data);
        if(err) {
            console.log("Something went wrong!");
        } else {
            console.log(`Twitter Bot tweeted: ${tweet.status}`);
        }
    });
}
