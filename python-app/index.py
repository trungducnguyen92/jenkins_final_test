#!/usr/bin/env python3

from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    x = "Hello World! "
    y = "latest "
    z = "jenkins_2"
    return x,y,z
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
    
x,y,z = hello()
print(x)
print(y)
print(z)
    
#from flask import Flask
#app = Flask(__name__)
#@app.route("/")
#def hello():
#    return "Hello World!"
#if __name__ == "__main__":
#    app.run(host="0.0.0.0", port=int("5000"), debug=True)
