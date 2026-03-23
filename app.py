from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Banking Scheduler Running"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
```

Then click **Commit changes** with message:
```
Fix: restore correct Flask app with port 80
