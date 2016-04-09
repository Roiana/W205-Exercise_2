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
git clone https://github.com/Roiana/W205-Exercise_2.git

#Creating a project in the "ex2" folder called "tweetwordcount"
sparse quickstart tweetwordcount

#Changing working directory to the "tweetwordcount" folder
cd /root/ex2/tweetwordcount
 
#Removing obsolete files from the "tweetwordcount" folder and copying
#the pertinent files from the cloned Github Repository for this exercise
rm config.json
cp /root/ex2/W205-Exercise_2/tweetwordcount/config.json /root/ex2/tweetwordcount
rm fabfile.py
cp /root/ex2/W205-Exercise_2/tweetwordcount/fabfile.py /root/ex2/tweetwordcount
rm project.clj
cp /root/ex2/W205-Exercise_2/tweetwordcount/project.clj /root/ex2/tweetwordcount
rm README.md
cp /root/ex2/W205-Exercise_2/tweetwordcount/README.md /root/ex2/tweetwordcount
rm tasks.py
cp /root/ex2/W205-Exercise_2/tweetwordcount/tasks.py /root/ex2/tweetwordcount
rm src/bolts/__init__.py
rm src/bolts/parse.py
rm src/bolts/wordcount.py
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/bolts/__init__.py /root/ex2/tweetwordcount/src/bolts
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/bolts/parse.py /root/ex2/tweetwordcount/src/bolts
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/bolts/wordcount.py /root/ex2/tweetwordcount/src/bolts
rm src/spouts/__init__.py
rm src/spouts/words.py
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/spouts/__init__.py /root/ex2/tweetwordcount/src/spouts
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/spouts/tweets.py /root/ex2/tweetwordcount/src/spouts
rm topologies/wordcount.clj
cp /root/ex2/W205-Exercise_2/tweetwordcount/topologies/tweetwordcount.clj /root/ex2/tweetwordcount/topologies
rm virtualenvs/wordcount.txt
cp /root/ex2/W205-Exercise_2/tweetwordcount/virtualenvs/tweetwordcount.txt /root/ex2/tweetwordcount/virtualenvs
cp /root/ex2/W205-Exercise_2/Twittercredentials.py /root/ex2
cp /root/ex2/W205-Exercise_2/hello-stream-twitter.py /root/ex2
cp /root/ex2/W205-Exercise_2/psycopg-sample.py /root/ex2
cp /root/ex2/W205-Exercise_2/tweetwordcount/src/crdbta.py /root/ex2/tweetwordcount/src

#Installing Tweepy
pip install tweepy

#Running the "hello-stream-twitter.py" program
python /root/ex2/hello-stream-twitter.py

#Running the program that creates the Postgres database
#and table
run crdbta.py

#Running the tweetwordcount project
sparse run

#Running a Python script which queries the Postgres database and return the
#number of times a specific word occurs in the stream or returns the number of
#times all the words in a stream occurs.
python /root/ex2/W205-Exercise_2/serve_scripts/finalresults.py
python /root/ex2/W205-Exercise_2/serve_scripts/finalresults.py hello

#Running a Python script which returns all the words that their total number
#of occurences in the stream is within certain bounds.
python /root/ex2/W205-Exercise_2/serve_scripts/histogram.py 3,8

#Running a Python script which counts the top 20 words in my twitter stream.
python /root/ex2/W205-Exercise_2/serve_scripts/barchart.py

