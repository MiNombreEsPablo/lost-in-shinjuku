# README - LOST IN SHINJUKU

This project is a prototype of a game developped for Builders Weekend. A hackathon conducted in Tokyo - Shibuya in 2024.

## Concept 

You are in an adventure game storybook, you are a Foreigner in Japan and are preparing for a date in Shinjuku station, you must navigate the station to collect  3 random items from the item list for your date and complete 2 tasks from the task list then finally meet your date.

The game ends when you gather all the items for your date then meet a date in Shinjuku station. The user can only speak English and must overcome Japanese people who only speak in Japanese

For each phase of the game, give the story and a description of the scene for image generation AI. The user will be given 4 options  on  how they want to interact with the story to move to the next phase, the game is not easy, you can fail your date and die. The story start with the first start input 

## Project

Technically the "game" is a one web page. Given an image, a prompt and 4 choices.
Each choice is a button and everytime a choice is made, an API call is made to __OpenApi__ to generate the next prompt and options. And another API call is made to __Stability AI__ to generate a new image.

## Installation

### Prerequisites 

* Ruby on rails (Check their [documentation](https://gorails.com/) for installation protocol)
* Yarn

### Local configuration

For local configuration you need to create a .env file with this content :
```
# LOCAL CONFIGURATION - FILE DO NOT COMMIT !

CLOUDINARY_URL=
OPENAI_API_KEY=
STABILITY_API_KEY=
```

Ask the product owner for cloudinary url and api keys.

### Getting started

* Fetch the project from [github](https://github.com/MiNombreEsPablo/lost-in-shinjuku)
* In the project folder use the following commands :
```
bundle install
yarn build --watch
rails s
```

You should be able to access the app with this url : http://127.0.0.1:3000/ 

## Technical stack

* Heroku (Deployment tool)
* Rails (Framework)
* VueJs (Front)
* OpenAI API (Text generation)
* Stability API (Image generation)
* Cloudinary (For image cloud storage)

## Environement

[Production URL](https://lost-in-shinjuku-4d98eadef32d.herokuapp.com/)