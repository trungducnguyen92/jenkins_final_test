from flask import Flask
app = Flask(__name__)
x = latest
y = jenkins_2
@app.route("/")
def hello():
    print ("Hello World!")
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
    
#from flask import Flask
#app = Flask(__name__)
#@app.route("/")
#def hello():
#    return "Hello World!"
#if __name__ == "__main__":
#    app.run(host="0.0.0.0", port=int("5000"), debug=True)
