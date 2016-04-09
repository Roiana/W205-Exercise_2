import tweepy

consumer_key = "fSNGuAoXxp4hoHWKJLpkjqcfY";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "SIv5czVlrvYzjIQUI7n5CyV7rxYiBCRz7bjhhGdnQB9CapMd94";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "392181377-ZrNvUdrSI2n2JyRgyrwp2gn865RkdaCNdUeGpDz9";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "3o2nwff5WlSr5T70NZcRHJVTxCz01TUupD8aQT9rdk8VG";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
