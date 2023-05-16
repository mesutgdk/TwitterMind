# TwitterMind

TwitterMind is a Machine Learning application that allows the user to predict public opinion about any name they want to ask using the latest 100 tweets and do a sentiment classification for that particular company-name-anthing questioned✌🏻.

<img width="144" alt="Ekran Resmi 2023-05-15 13 28 29" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/13fc46cb-c0b4-480b-9b26-e04eeadbb679">
<img width="144" alt="Ekran Resmi 2023-05-15 13 29 56" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/9528d930-101d-4e46-bafb-3c2330cdce02">
<img width="135" alt="Ekran Resmi 2023-05-15 13 30 37" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/95b0e284-6bda-4380-8a6f-87d4bbc3b59c">


# What I Made

I made a ml module from Twitter Sentiment Database created by Cornell University

https://arxiv.org/abs/1610.09225

Also i used Matt Donnell's Swifter and import SwifteriOS.framework

https://github.com/mattdonnelly/Swifter

<img width="320" alt="Ekran Resmi 2023-05-15 09 01 30" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/ba6950a8-1b60-4316-911f-505ff39075a1">

By using Swifter, the function searchTweet, i took 100 tweets with "count" parameter, 'lang = "en" ' parameter for english code in ISO-6391 and 'tweetmode = .extend' to break the 280 charecters limitation of tweets.

<img width="400" alt="Ekran Resmi 2023-05-15 19 09 18" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/6e690254-51df-4514-aa98-abc96e4b6d18">

After that, i implemented TweetMindClassifier.mlmodel which i created from the Twitter Sentiment Database

<img width="512" alt="Ekran Resmi 2023-05-15 09 10 11" src="https://github.com/mesutgdk/TwitterMind/assets/112901255/9fdc6827-8ca8-4579-9681-ff1c4929655b">


