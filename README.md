PTrain
======

Disclaimer: This project is likely not useful to anyone but myself. I run
ptrain locally so I keep the source and DB online for easy access.

PTrain is a simple Rails web app that tracks weight and measurements from
weekly weigh-ins and displays charts for weight, body fat percentage, and waist
size. This app is how I track my progress when training for a particular goal.
Note that I track specific relevant body measurements and bodyfat using a
Tanita bodyfat scale. Of course if you are familiar with bodyfat scales, you'll
know that they are very imprecise and fluctuate wildly based on water levels.
For this reason, I'm not concerned with the number rather the delta change over
the weeks and I take care to always weigh-in in the same conditions &mdash;i.e.
first thing Monday morning before consuming water or food. In general, waist
size change is a clear indication of overall fat loss. Visibility of abdominal
muscles generally indicates that bodyfat levels have reached below 10%. I've
hardcoded images of my favourite athletes and my target numbers as the header.
Not much more development will be done on this web app. If I ever can get some
time to work on it, I'll create a native Android app.

The charts are generated using Google Charts (see
app/views/weigh_ins/_chart.html.erb). The rest of the app just uses the
standard Rails scafolding for basic CRUD operations. The DB is SQLite.
