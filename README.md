Chat Word Cloud
===============

Word cloud of the Code &amp; Supply chat

This script needs to be run through an interactive R session to work
properly. To generate the word cloud, follow the steps below.
![](http://i.imgur.com/QKn6QVj.png)

Instructions
------------

1. Obtain a Slack "Team Export" dump of all the data for a team
2. Open an interactive R session
3. Ensure that the libraries `jsonlite`, `tm`, and `wordcloud` are
   installed. Install them using `install.packages()` if necessary
4. Use the R command `setwd()` to set the working directory the be
   inside the directory of the exported data
5. Run the commands in the script `slack-wordcloud.r` in your
   interactive session.
6. View your beautiful word cloud!

Inspirations
------------
[Gist explaining generating word clouds from slack](https://gist.github.com/michael-erasmus/eb0e30c4fba8ba5a5121)
