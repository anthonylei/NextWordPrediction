
library(shiny)
library(data.table)
source("Predict.R")
load("ngramData.RData")

shinyServer(function(input, output) {
    
    output$urlText <- renderText({
        as.character(input$sentence)
    })
    
    output$predict1 <- renderText({
        as.character(nextword(input$sentence, 
                 ngramData = ngramData, 
                 numberSuggestion = 5)[1])
    })
    output$predict2 <- renderText({
        as.character(nextword(input$sentence, 
                 ngramData = ngramData, 
                 numberSuggestion = 5)[2])
    })
    output$predict3 <- renderText({
        as.character(nextword(input$sentence, 
                 ngramData = ngramData, 
                 numberSuggestion = 5)[3])
    })
       
})
