from flask import Flask, jsonify, render_template
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from config import db_password

db_string = f"postgresql://postgres:{db_password}@127.0.0.1:5432/nba_champs"
engine = create_engine(db_string)

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/stats")
def nba():
    connection = engine.connect()
    connection.execute("SELECT * FROM cy_stats;")
    connection.close()

if __name__ == '__main__':
    app.run()
