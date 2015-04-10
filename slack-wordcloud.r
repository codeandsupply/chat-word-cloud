#Obviously these need to be installed!
library(jsonlite)
library(tm)
library(wordcloud)

output.filename <- "~/Desktop/wordcloud.png"

files <- list.files('.',"*.json", recursive=T)
 
json <- sapply(files, fromJSON)
 
texts <- sapply(json, function(f){if ('subtype' %in% names(f)) f$text[is.na(f$subtype)] else f$text})
 
flat <- unlist(texts)

removeUsernames <- function(doc) {
    gsub("<@[0-9a-zA-Z]*>", "", doc)
}

removeCharacters <- function (doc, characters)  {
    pattern <- paste(characters, collapse = "|")
    gsub(pattern, "", doc, perl = TRUE)
}

corpus <- Corpus(VectorSource(flat))

# Remove slack username identifiers
corpus <- tm_map(corpus, removeUsernames)

# general cleaning
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)

# Remove a unicode apostrophe
corpus <- tm_map(corpus, removeCharacters, c('\u2019'))

# Remove some stopwords
corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus <- tm_map(corpus, removeWords, c('just', 'like', 'can', 'get'))

# Generate the wordcloud and save it to a png
png(output.filename, height=800, width=800)
wordcloud(corpus, scale=c(4,1), max.words=300, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
