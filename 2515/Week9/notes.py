# The client sends an HTTP request to the server which will be implemented in
# Flask for us. 
# We are going to look at 3 things about that request:
# 1
# There are a few methods that HTTP uses to send the requests,
# depending on the kind of data is requested or sent. The mains ones are GET,
# PUT, POST, and DELETE. 
# 2
# The next thing in the request that we are concerned with is the HTTP URL
# path, or the address that the request is being made to. 
# 3
# The last thing will be the data/payload for the request. This is the data
# that is being uploaded or sent, or it can be the data requested or
# downloaded.

# The HTTP response will send back the data and this response will have a few
# status codes. 200 means that everything was fine. We can also change the
# status code in the response. This is done by returning a tuple with a number
# as the second number of the return.

# don't name your file flask.py
from flask import Flask, render_template

# the name thing will be replaced with the name of the current file
app = Flask(__name__) 

# flask will run this whenever it gets a request on the / URL
@app.route("/")
def homepage():
    # with flask we need to return a string or a dictionary for now. 
    # the browser will display whatever string is returned. But browsers are
    # made to display HTML so we have to return HTML.

    # return "<html><body><h1>HI THERE!</h1></body></html>"

    # it is alwasy good to separate the presentation or the HTML from the
    # python code. Flask has a thing called templates where we can store all
    # our html templates. Use render_template to return an HTML template
    return render_template("home.html", name="Tim")
    # all the templates should be stored in the templates folder in the same
    # directory as the flask app. 

    # We can change the html file as much as we want, flask will will send
    # that template to the browser. 

    # But what's useful about the templates in flask is that you can use them
    # to share data in between the template and the python code. On the return
    # statement, we have added a second argument for the render_template as a
    # variable called "name". This will be sent to the template and ultimately
    # to the browser. 

    # return render_template("home.html", name="Tim")

# you can also control how the browser reacts to different URLs. This is a
# route. We can also send parameters in the URLs. Below we have the syntax for
# sending the code for parameters in the URL of the route. 
@app.route("/add/<int:num1>/<int:num2>")
def add(num1, num2):
    # we must always send a string back to the browser. If we don't have the
    # str() conversion here, we will get a typeError in the browser. This is
    # where we have to be careful about parameter validation and sending back
    # the correct type of the variable. 
    # For example, if we do string:num1 and string:num2 in the URL parameter,
    # the strings will be concatenated and our logic will be completely wrong. 
    return str(num1 + num2)

@app.route("/hello/<string:name>")
def hello(name):
    return render_template("home.html", name=name)

# if we run the file, we want to run the flask app. 
if __name__ == '__main__':
    app.run(debug=True)