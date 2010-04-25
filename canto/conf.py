from canto.extra import *
import os

# Handlers when in Linux console or xterm
if os.getenv("TERM") == "linux":
    link_handler("elinks \"%u\"", text=True)
    image_handler("fbi \"%u\"", text=True, fetch=True)
else:
    link_handler("uzbl-browser \"%u\"")
    image_handler("feh \"%u\"", fetch=True)

# Max column width of 65 characters
def resize_hook (cfg):
    cfg.columns = cfg.width / 65

# Never discard items I haven't seen
never_discard("unread")

# I prefer change_tag to interval
# Uncomment these to use it too

# triggers.remove("interval")
# triggers.append("change_tag")

keys['/'] = search_filter
keys['y'] = yank

# Use [ / ] to switch between global filters
filters=[show_unread, None]

# Make unread items float to the top, when not
# using show_unread filter
default_tag_sorts([by_unread])

# Selected Feeds
default_rate(30)    # News feeds
add("http://feeds.feedburner.com/codinghorror")
add("http://feeds.reuters.com/reuters/oddlyEnoughNews")
add("http://feeds.reuters.com/reuters/domesticNews")
add("http://feeds.reuters.com/reuters/scienceNews")
add("http://feeds.reuters.com/reuters/topNews")
add("http://feeds.reuters.com/reuters/sportsNews")
add("http://feeds.reuters.com/reuters/healthNews")
add("http://news.cnet.com/8300-13772_3-52.xml")
add("http://news.cnet.com/8300-30685_3-264.xml")
add("http://news.cnet.com/2547-11386_3-0-5.xml")
add("http://news.cnet.com/8300-13578_3-38.xml")
add("http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml")
#...

# Blog Feeds
#default_rate(120)   # Slow blog feeds
#add("http://blog1")
#add("http://blog2")

# Quick Feeds
#default_rate(1)     # Quick feed
#default_keep(100)   # Lots of items could be missed
#add("http://quick1")
#add("http://quick2")

# Colors
colors[0] = (145, 234)
colors[1] = (181, 234)
colors[2] = (237, 234)

# Non-HTML Content
link_handler("mplayer -someoptions \"%u\"", ext="mp3")

# PDF Handling
link_handler("apvlv \"%u\"", ext="pdf", fetch=True)

# Image Handling
image_handler("fbv \"%u\"", text=True, fetch=True)

# Download Handling
#reader_keys['w'] = wget_link("/home/mredd/.canto/downloads")

# Reader Layout
reader_orientation = None       # Default floating
reader_orientation = "left"     # Dedicated left of the item list
reader_orientation = "right"    # Dedicated right of the item list
reader_orientation = "top"      # Dedicated on top of the item list
reader_orientation = "bottom"   # Dedicated under the item list
reader_lines = 10               # Dedicated size of layout

# Layout Hook
def resize_hook (cfg):
    cfg.reader_orientation = "center"
    cfg.reader_lines = cfg.width / 2
    cfg.columns = (cfg.width / 2) / 65

# Download Handling
#reader_keys['w'] = wget_link("/home/mredd/.canto/downloads")

# Some examples
# Uncomment if you've downloaded the script
# add("script:slashdotpolls -external")
#
# Simple password example
# add("http://feedparser.org/docs/examples/digest_auth.xml", username="test",
#        password="digest")

