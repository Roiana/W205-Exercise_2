from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2

class WordCounter(Bolt):


    def initialize(self, conf, ctx):
        self.counts = Counter()


    def process(self, tup):
        word = tup.values[0]

        # Increment the local count
        self.counts[word] += 1
        

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        # Inserting new words into the database which are NOT already in the database
        cur.execute("INSERT INTO tweetswordcount (word,count) SELECT %s,%s WHERE NOT EXISTS (SELECT * FROM tweetswordcount WHERE word=%s)", (word,1,word))
        # Updating the word count for words which are already in the database
        cur.execute("UPDATE tweetswordcount SET count=%s WHERE word=%s", (self.counts[word], word))
        conn.commit()
        conn.close()

        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
