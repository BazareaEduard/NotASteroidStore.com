from flask import Flask, request, jsonify
from difflib import get_close_matches
import json

app = Flask(__name__)

def load_knowledge_base(file_path: str) -> dict:
    with open(file_path, 'r') as file:
        data: dict = json.load(file)
    return data

def save_knowledge_base(file_path: str, data: dict):
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=2)

def find_best_match(user_question: str, questions: list[str]) -> str | None:
    matches: list = get_close_matches(user_question, questions, n=1, cutoff=0.6)
    return matches[0] if matches else None

def get_answer_for_question(question: str, knowledge_base: dict) -> str | None:
    for q in knowledge_base["questions"]:
        if q["question"] == question:
            return q["answer"]

@app.route('/ask', methods=['POST'])
def ask():
    user_input = request.form['user_input']
    knowledge_base = load_knowledge_base('knowledge_base.json')

    if user_input.lower() == 'quit':
        return "Chat ended."

    best_match = find_best_match(user_input, [q["question"] for q in knowledge_base["questions"]])

    if best_match:
        answer = get_answer_for_question(best_match, knowledge_base)
    else:
        answer = "I don't know the answer. Can you teach me?"

    return jsonify({'response': answer})

@app.route('/')
def index():
    return """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Title</title>
    </head>
    <body>
        <h1>Chatbot</h1>
        <form action="/ask" method="post">
            <input type="text" name="user_input" placeholder="Type your question here...">
            <input type="submit" value="Ask">
        </form>
        <div id="response"></div>
    </body>
    </html>
    """

if __name__ == '__main__':
    app.run(debug=True)
