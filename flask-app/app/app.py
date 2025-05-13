from flask import Flask, jsonify
import redis

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = cache.incr('hits')
    return jsonify(message="Hello from Flask!", hit_count=int(count))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)