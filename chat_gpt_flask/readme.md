setup env code 
Python env setup

```
python3 -m venv myprojectenv
source myprojectenv/bin/activate
pip install Flask
pip install openai
pip install python-dotenv
```


Run chat_gpt_api_flask.py

First add the chatgpt api key into the .env file

```
python3 chat_gpt_api_flask.py
```
This load the chatgpt api server that take in json post call and save each iteration to a test.json file 

example api call : start api session 

```
curl -X POST -H "Content-type: application/json" -d "{\"message\" : \"start\"}" "loca
lhost:5000/chat"
```

example api call : reply to option message
```
curl -X POST -H "Content-type: application/json" -d "{\"message\" : \"3\"}" "loca
lhost:5000/chat"
```
