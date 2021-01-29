# databyte_inductions
Files for the induction process

I've used Flutter by Google. It's a cross platform application development tool with which we can build apps for both IOS and Android from one single codebase.
I've used a sequential model using Tensorflow and then converted it to Tensorflow Lite to integrate it with the Flutter app. 
An optimizer also exists to increase accuracy and reduce the loss factor in the model.
I've used the tflite_flutter package to ease usage of Tensorflow Lite inside the app.
The python code using Tensorflow is placed in a Flask project and the app networks with the Flask project using APIs.
The functions performed in Flask is returned to the app in the form of Jsons. We decode the Json file and then use it in the app.
