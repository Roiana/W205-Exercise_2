import psycopg2
import operator
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetswordcount")
records = cur.fetchall()

sortrec = sorted(records, key=operator.itemgetter(0))

if len(sys.argv) > 1:
   for rec in sortrec:
       if rec[0] == str(sys.argv[1]):
          print "Total number of occurences of '",rec[0],"':", rec[1]
else:
   for rec in sortrec:
       print (rec[0],rec[1])
conn.commit()

conn.close()
