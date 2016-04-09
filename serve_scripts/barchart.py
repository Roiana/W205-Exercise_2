import psycopg2
import operator
import sys
import numpy as np
from matplotlib import pyplot as plt
import pylab

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetswordcount")
records = cur.fetchall()

sortrec = sorted(records, key=operator.itemgetter(1), reverse = True)

sort20 = sortrec[0:20]

x= zip(*sort20)[0]

y= zip(*sort20)[1]

lab_holder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

plt.ion()
plt.bar(lab_holder,y)
plt.xticks(lab_holder, x)
plt.show()

for rec in sort20:
    print rec[0], ":", rec[1]

print x, y
