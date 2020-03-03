Author: Furkan Dindar

Design Patterns used: Proxy, Singleton, Decorator Patterns

In this project, I created 3 different API classes which are subclasses of ApiProxy.rb abstract class. 3 API classes are;

1- IpProxy.rb is getting computer's IP adress via https://api.ipify.org?format=json , and I am changing the Ip address' . to + (e.g : 192.168.2.1 --> 192+168+2+1)

2- MathPoxy.rb takes the IP that we collected from 1 (it gets the changed version) and passes it to https://newton.now.sh/simplify/ . This API gets the numbers and returns the result of them.

3- FactProxy.rb takes the result that we collected from 2 and passes it to http://numbersapi.com/ . This api gets the number and returns a fact about the number that we sent. The fact is the output of this project.

* All the APIs return json type responses.

Log.rb class uses Singleton Pattern, to store the data in log file. Everytime there is a difference, the Lob.rb class also writes the last modified date time in the beginning.

I chose to use Decorator Pattern as the 3rd pattern for this project. The DecoratorPattern.rb class is created to manage all these API classes described below. Also, the result can be seen in the command prompt and this is provided by the function print_data_to_screen.
