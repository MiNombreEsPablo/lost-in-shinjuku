from openai import OpenAI
import os 
from flask import Flask, request, jsonify
import json
from dotenv import load_dotenv
# Load environment variables from .env file
load_dotenv()
os.environ["OPENAI_API_KEY"]=os.getenv('API_KEY')

from utils import random_str,append_message_to_json_file
os.remove("test.json")
section_file="test.json" #random_str()+".json"

client = OpenAI()


# Initialize the Flask application
app = Flask(__name__)

client = OpenAI()
# Set your OpenAI API key here
system_data = """
You are an adventure game storybook, 
You Foreigner in Japan and are preparing for a date in Shinjiku station,
you must navigate Shinjuku station to collect  3 random items , from the item list , for your date, and complete 2 tasks from the task list then finnaly meet your date,
The game ends when you Gather all the items for your date then meet a date in Shibuya station,
The user can only speak English and must overcome Japanese people who only speak in Japanese
For each phase of the game, give the story and a description of the scene for image generation AI,
The user will be given 4 options  on  how they want to interact with the story to move to the next phase,
the game is not easy, you can fail your date and die, there is a murderer on the lose
The story start with the first start input 
Output as JSON file, with the phase number, story, description_scene, with the options as 1 2 3 4 
item list 
・Roses
・Box Chocolates
・Otaku Tshirt
・Anime merch 
・BDay Cake
・Neckless
・PhotoFrame
・Japan merch
Actions list 
・Book a room for the night Love hotel
・Put your baggage in the locker 
・Go for a shower in the Manga Cafe 
・Get Hair cut 
・Buy some new clothes 

"""
messages=[{"role": "system","content":system_data}]
_=append_message_to_json_file(section_file,messages)

@app.route('/chat', methods=['POST'])
def chat():
    # Get the user message from the request
    user_message = request.json.get('message', '')
    message = append_message_to_json_file(section_file,{"role": "user", "content": user_message})
    # Generate a response using OpenAI's GPT model
    response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=messages,
    )
    # Extract the text of the response
    bot_response = response.choices[0].message.content
    print(bot_response)
    # Return the bot's response in JSON format
    return jsonify({'response': bot_response})

if __name__ == '__main__':
    # Run the Flask app
    app.run(debug=True, port=5000)
