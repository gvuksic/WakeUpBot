# WakeUpBot

## About

This project was built for the [Junction Online Challenge](https://www.reddit.com/r/JunctionCommunity/comments/b7csl5/march_online_challenge_bots_bots_bots/). Goal of the challenge was to build a bot in 24 hours that should embed unnecessarily-extreme stupidity.

## Description

Are you looking for a Slack bot that will motivate your team and help them focus? Are you looking for a Slack bot that will bring fun to your whole office? Was Whack-A-Mole one of your favourite games? If answer is yes to at least one of those questions, this is a bot for you and your team!

In order to use this bot you'll need a bit of hardware setup, full details about how it works and how to set it up are below.

Each team member should have helmet with a hammer on his head. It is easy to assemble it from LEGO BOOST, here is quick overview how to do it:

Set up base out of LEGOs, it should fit your head:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/bot-1.jpg)

Add holder for LEGO BOOST motor:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/bot-2.jpg)

Put LEGO BOOST motor on top:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/bot-3.jpg)

Assemble the hammer out of LEGOs and attach it to the LEGO BOOST motor:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/bot-4.jpg)


## Architecture overview

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/architecture.png)

Application is built on AWS technologies, it is fully scalable, reliable and secure. Slack Bot via command invokes Lambda via API Gateway and store message into DynamoDB database. iOS application, which is connected to the LEGO BOOST hub, periodically checks is there some new message and starts the motor on the LEGO BOOST. Hammer moves in one direction, than goes into oposite direction to the starting position, afterwards complete message is sent to the database.

## Bot Preview (See it in action)

Bot can be started with the following command:

```
/WakeUp @SlackUsername
```

Preview of conversation with the bot:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/bot-preview.gif)

Feel free to check out following Youtube video to see helmet in action (click on image to open Youtube):

[![Youtube Video](https://img.youtube.com/vi/vgFAblJFa_w/0.jpg)](https://www.youtube.com/watch?v=vgFAblJFa_w "Youtube Video of Bot in Action")

## Use Cases

Use WakeUpBot to:
 - wake up specific member of your team; with making them focus more they'll make more work done!
 - have fun with your colleagues at work
 - motivate your team members
 - punish your colleagues for typing bad code
 - easily reach team member that is listening music on headphones
 - and more!

## Final Words

Use it at your own risk! 😉

## 2nd Place

I'm happy this project was recognised by Junction judges and it won 2nd place. 🏆

Follow Junction community for more online challenges here: [Junction Community](https://www.reddit.com/r/JunctionCommunity/)

Screenshot of their winners announcement:

![](https://github.com/gvuksic/WakeUpBot/blob/master/Assets/2ndplace-Junction.png)
