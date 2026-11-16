from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def index():
    return f"<h1>{socket.gethostname()}</h1>"
