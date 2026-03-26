from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "message": "Hello from EKS using Terraform + Docker + GitHub Actions",
        "environment": os.getenv("ENVIRONMENT", "dev")
    }

@app.route("/health")
def health():
    return {"status": "ok"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)