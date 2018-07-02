/*jshint esversion: 6 */

const Twit 		= require('twit'),
      // config 	= require('./config'),
      exec 		= require('child_process').exec,
      fs 			= require('fs');

console.log("TwitterBot started");
const cmd = "processing-java --sketch=`pwd`/SpotBot --run";

// local
// const T = new Twit(config);

// heroku
const T = new Twit({
    consumer_key: 				process.env.SB_CONSUMER_KEY,
    consumer_secret:			process.env.SB_CONSUMER_SECRET,
    access_token:					process.env.SB_ACCESS_TOKEN,
    access_token_secret:	process.env.SB_TOKEN_SECRET
});

newTweet();
setInterval(newTweet, 8.64e+7);

function newTweet() {
    exec(cmd, createAndUploadImage);
}

function createAndUploadImage() {
    console.log("SpotBot image generated!");
    let filename = 'SpotBot/output.png';
    let b64image = fs.readFileSync(filename, {encoding: 'base64'});

    T.post('media/upload', {media_data: b64image}, tweetImage);
}

function tweetImage(err, data, response) {
    let id = data.media_id_string;
    let date = new Date().toDateString();
    let statusText = `Generated: ${date}\n#processing #generativeart #creativecoding`;

    let tweet = {status: statusText,
                 media_ids: [id]};

    T.post('statuses/update', tweet, (err, data, response) => {
        if(err) {
            console.log("Something went wrong!");
        } else {
            console.log(`Twitter Bot tweeted: ${tweet.status}`);
        }
    });
}
