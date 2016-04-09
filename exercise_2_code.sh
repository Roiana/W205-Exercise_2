#Code to setup the project
#Activating the virtual environment for Python 2.7​
source /opt/py27environment/bin/activate

#Installing streamparse
pip install streamparse

#Installing psycopg
pip install psycopg2

#Making a directory called "ex2"
mkdir ex2

#Changing current directory to "ex2"
cd ex2/

#Cloning the Github Repository for Exercise 2 into my "ex2" folder
git clone https://github.com/UC-Berkeley-I-School/w205-spring-16-labs-exercises.git

#Creating a project in the "ex2" folder called "tweetwordcount"
sparse quickstart tweetwordcount

#Changing working directory to the "tweetwordcount" folder
cd /root/ex2/tweetwordcount

#Removing obsolete files from the "tweetwordcount" folder and copying
#the pertinent files from the cloned Github Repository for this exercise
rm config.json
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/config.json /root/ex2/tweetwordcount
rm fabfile.py
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/fabfile.py /root/ex2/tweetwordcount
rm project.clj
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/project.clj /root/ex2/tweetwordcount
rm README.md
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/README.md /root/ex2/tweetwordcount
rm tasks.py
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/tasks.py /root/ex2/tweetwordcount
rm src/bolts/__init__.py
rm src/bolts/parse.py
rm src/bolts/wordcount.py
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/src/bolts/__init__.py /root/ex2/tweetwordcount/src/bolts
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/src/bolts/parse.py /root/ex2/tweetwordcount/src/bolts
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/src/bolts/wordcount.py /root/ex2/tweetwordcount/src/bolts
rm src/spouts/__init__.py
rm src/spouts/words.py
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/src/spouts/__init__.py /root/ex2/tweetwordcount/src/spouts
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/src/spouts/tweets.py /root/ex2/tweetwordcount/src/spouts
rm topologies/wordcount.clj
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/topologies/tweetwordcount.clj /root/ex2/tweetwordcount/topologies
rm virtualenvs/wordcount.txt
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/tweetwordcount/virtualenvs/tweetwordcount.txt /root/ex2/tweetwordcount/virtualenvs
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/Twittercredentials.py /root/ex2
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/hello-stream-twitter.py /root/ex2
cp /root/ex2/w205-spring-16-labs-exercises/exercise_2/psycopg-sample.py /root/ex2

#Installing Tweepy
pip install tweepy


#Code for modifying, creating and running various files
#Entering the "tweetwordcount.clj" file in order to implement the required topology
vim /root/ex2/tweetwordcount/topologies/tweetwordcount.clj

#Entering the "Twittercredentials.py" file in order to insert my consumer key,
#consumer secret, access token, and access token secret
vim /root/ex2/Twittercredentials.py

#Running the "hello-stream-twitter.py" program
python /root/ex2/hello-stream-twitter.py

#Entering the "tweets.py" file in order to insert the access keys needed to
#pull the tweets from Twitter
vim /root/ex2/tweetwordcount/src/spouts/tweets.py

#Creating a Python program which creates the Postgres database and table
#needed to store the results of the word count
vi crdbta.py

#Running the program created right above that creates the Postgres database
#and table
run crdbta.py

#Entering the "wordcount.py" file to insert code which inserts new rows into
#the table containing new words and to update the word count for the words
vim /root/ex2/tweetwordcount/src/bolts/wordcount.py

#Running the tweetwordcount project
sparse run

#Creating a Python script which query the Postgres database and return the
#number of times a specific word occurs in the stream or returns the number of
#times all the words in a stream occurs.
vi finalresults.py

#Creating a Python script which returns all the words that their total number
#of occurences in the stream is within certain bounds.
vi histogram.py

#Creating a Python script which counts the top 20 words in my twitter stream.
vi barchart.py

#Running the short serving scripts created above
python finalresults.py hello
python finalresults.py
python histogram.py 3,8
python barchart.py
