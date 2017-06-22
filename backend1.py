from flask import Flask 
import os 
os.environ["LC_ALL"] = "en_US.utf-8" 
os.environ["LANG"] = "en_US.utf-8"

app = Flask(__name__)  

@app.route('/') 
def home():
    return 'Hello world!'
