from __future__ import absolute_import, print_function, unicode_literals

import itertools, time
import tweepy, copy
import Queue, threading


from streamparse.spout import Spout

################################################################################
# Twitter credentials
################################################################################
twitter_credentials = {
    "consumer_key"        :  "fSNGuAoXxp4hoHWKJLpkjqcfY",
    "consumer_secret"     :  "SIv5czVlrvYzjIQUI7n5CyV7rxYiBCRz7bjhhGdnQB9CapMd94",
    "access_token"        :  "392181377-ZrNvUdrSI2n2JyRgyrwp2gn865RkdaCNdUeGpDz9",
    "access_token_secret" :  "3o2nwff5WlSr5T70NZcRHJVTxCz01TUupD8aQT9rdk8VG",
}


def auth_get(auth_key):
    if auth_key in twitter_credentials:
        return twitter_credentials[auth_key]
    return None

################################################################################
# Class to listen and act on the incoming tweets
################################################################################
class TweetStreamListener(tweepy.StreamListener):

    def __init__(self, listener):
        self.listener = listener
        super(self.__class__, self).__init__(listener.tweepy_api())

    def on_status(self, status):
        self.listener.queue().put(status.text, timeout = 0.01)
        return True

    def on_error(self, status_code):
        return True # keep stream alive

    def on_limit(self, track):
        return True # keep stream alive

class Tweets(Spout):

    def initialize(self, stormconf, context):
        self._queue = Queue.Queue(maxsize = 100)
