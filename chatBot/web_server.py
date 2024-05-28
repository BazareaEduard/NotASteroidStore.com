from http.server import HTTPServer, BaseHTTPRequestHandler
import json
from difflib import get_close_matches

class Serv(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
        try:
            file_to_open = open(self.path[1:], 'rb').read()
            self.send_response(200)
        except FileNotFoundError:
            file_to_open = b"File not found"
            self.send_response(404)
        self.end_headers()
        self.wfile.write(file_to_open)

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        data = json.loads(post_data)
        question = data.get('question')

        knowledge_base = load_knowledge_base('knowledge_base.json')
        best_match = find_best_match(question, [q["question"] for q in knowledge_base["questions"]])

        if best_match:
            answer = get_answer_for_question(best_match, knowledge_base)
        else:
            answer = "I don't know the answer. Can you teach me?"

        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps({'answer': answer}).encode('utf-8'))

def load_knowledge_base(file_path: str) -> dict:
    with open(file_path, 'r') as file:
        data = json.load(file)
    return data

def save_knowledge_base(file_path: str, data: dict):
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=2)

def find_best_match(user_question: str, questions: list[str]) -> str | None:
    matches = get_close_matches(user_question, questions, n=1, cutoff=0.8)
    return matches[0] if matches else None

def get_answer_for_question(question: str, knowledge_base: dict) -> str | None:
    for q in knowledge_base["questions"]:
        if q["question"] == question:
            return q["answer"]

httpd = HTTPServer(('localhost', 8080), Serv)
httpd.serve_forever()
