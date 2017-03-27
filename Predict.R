
splitHelper <- function(text = NULL, NumberSplit = NULL) {
    if (length(text) > 2){
        return(paste(tail(text, NumberSplit), collapse = " "))
    } else {
        return(paste(text, collapse = " "))
    }
}

nextword <- function(input = NULL, ngramData, numberSuggestion = 3){
    if (is.null(input)) return(NULL)
    input <- tolower(input)
    splitText <- unlist(strsplit(input, split = " "))
    cleanText <- splitHelper(text = splitText, NumberSplit= 3)
    four <- rev(tail(ngramData$Fourgrams[ngram == cleanText]$nextword,
                             numberSuggestion))
    if (length(four) >= numberSuggestion){
        return(data.table(pred = four))
    } else {
        predit <- four
        cleanText <- splitHelper(text = splitText, NumberSplit= 2)
        three <- rev(ngramData$Trigrams[ngram == cleanText]$nextword)
        predit <- c(predit, three)
        if (length(unique(predit)) >= numberSuggestion){
            return(data.table(pred = unique(predit)[1:numberSuggestion]))
        } else {
            cleanText <- splitHelper(text = splitText, NumberSplit= 1)
            two <- rev(ngramData$Bigrams[ngram == cleanText]$nextword)
            
            predit <- c(predit, two)
            if (length(unique(predit)) >= numberSuggestion){
                return(data.table(pred = unique(predit)[1:numberSuggestion]))
            } else {
                one <- rev(tail(ngramData$Tokens$nextword, numberSuggestion))
                predit <- c(predit, one)
                return(data.table(pred = unique(predit)[1:numberSuggestion]))
            }
        }
    }
}

# x <- nextword("I don't", ngramData = ngramData, numberSuggestion = 5)
# str(as.character(x[1]))

