import psycopg2
import operator
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetswordcount")
records = cur.fetchall()

sortrec = sorted(records, key=operator.itemgetter(1))

print sys.argv[1]

fi = sys.argv[1].split(",")[0]
si = sys.argv[1].split(",")[1]

for rec in sortrec:
    if (rec[1] >= int(fi) and rec[1] <= int(si)):
        print rec[0], ":", rec[1]
        
