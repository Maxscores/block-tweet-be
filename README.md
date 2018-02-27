# HackCU V4 - 2018
This is the repository for the backend side of our project. 

## Inspiration
Coming into HackCU, we knew we wanted to use Google Sentiment Analysis with social media. When we were here we became excited about the challenges proposed by OppenheimerFunds and Twitter, so we decided to focus on a market sentiment analysis.

## What it does
Every hour we collect the most popular tweets in four categories: "bitcoin", "ethereum", "blockchain", and "crypto". We package those tweets up and send them through the Google Natural Language API to get a sentiment score and magnitude for each category. Our React front-end queries the backend API of scores and plots them against hour by hour bitcoin and ethereum price data.

## How we built it
Our team was composed of two front-end developers and two back-end developers. On the back-end, we built a Rails API to serve data to the front-end. We host the backend on Heroku and using Heroku Scheduler, we make hourly calls to the Twitter API. We send this tweet data through the Google Natural Language sentiment analyzer and create normalized values based on sentiment (-1 negative to 1 positive) and magnitude (degree of certainty).

## Challenges we ran into
Scraping historical Tweets: Part of the challenge from Twitter was to use their basic API package, which had limitations in it's search functionality. We wanted hourly data points going back as far as possible, but the basic plan only allowed for search within the last 7 days. In addition, the parameters only allowed for search granularity by day. To work within this limitation, we wrote a script that recursively steps back in time using the max_id parameter and saves data on the hour.

## Accomplishments that we're proud of
We are proud of the solution we implemented to circumnavigate the limited access to time-based granularity of tweets.

## What we learned
We learned how to build and format separate front-end and back-end applications that can communicate with one another. In our school experience, the front-end and back-end programs are very separated, so we enjoyed being able to combine our collective knowledge and experience for formulate a setting that will be more indicative of an actual work environment.

## What's next for Block Tweet
Going public and becoming Bitcoin millionaires! Jk. We are 7 weeks from graduation and looking forward to our careers in software.

## API
You can hit our sentiment data endpoint by sending a GET request to `https://hackcuv4.herokuapp.com/api/v1/hour_sentiment`
It will return a JSON object with this format:
```
{
  "bitcoin": [
    {
    "id": 1116,
    "normalized_score": 0,
    "query": "bitcoin",
    "hours_ago": -244,
    "created_at": "2018-02-15T13:34:03.000Z"
    },
    {
    "id": 1112,
    "normalized_score": 10.140000303685667,
    "query": "bitcoin",
    "hours_ago": -243,
    "created_at": "2018-02-15T14:29:49.000Z"
    }
  ],
  "ethereum": [
    {
      "id": 1117,
      "normalized_score": 3.62000013023615,
      "query": "ethereum",
      "hours_ago": -244,
      "created_at": "2018-02-15T13:34:03.000Z"
    },
    {
      "id": 1113,
      "normalized_score": 3.779999980032443,
      "query": "ethereum",
      "hours_ago": -243,
      "created_at": "2018-02-15T14:29:49.000Z"
    }
  ],
  "blockchain": [
    {
    "id": 1118,
    "normalized_score": 3.7400002083182358,
    "query": "blockchain",
    "hours_ago": -244,
    "created_at": "2018-02-15T13:34:03.000Z"
    },
    {
    "id": 1114,
    "normalized_score": 19.169999980479474,
    "query": "blockchain",
    "hours_ago": -243,
    "created_at": "2018-02-15T14:29:49.000Z"
    }
  ],
  "crypto":[
    {
    "id": 1119,
    "normalized_score": 3.509999899715183,
    "query": "crypto",
    "hours_ago": -244,
    "created_at": "2018-02-15T13:34:03.000Z"
    },
    {
    "id": 1115,
    "normalized_score": 3.3200001257658016,
    "query": "crypto",
    "hours_ago": -243,
    "created_at": "2018-02-15T14:29:49.000Z"
    }
  ]
}

```
