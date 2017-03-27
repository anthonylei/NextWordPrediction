
library(shiny)

shinyUI(fluidPage(
    titlePanel("Data Science Specialization Capstone Project: Next Word Prediction"),
    
    fluidRow(
        column(4, wellPanel(
            textInput("sentence", "Text Input:", "I don't")
        )),
        column(8, wellPanel(
            h5("Inputted Text:"),
            verbatimTextOutput("urlText")
        ))
    ),
    fluidRow(
        column(12, wellPanel(
            h4("Most likely next word:"),
            verbatimTextOutput("predict1")
        ))
    ),
    fluidRow(
        column(12, wellPanel(
            h4("Second most likely next word:"),
            verbatimTextOutput("predict2")
        ))
    ),
    fluidRow(
        column(12, wellPanel(
            h4("Third most likely next word:"),
            verbatimTextOutput("predict3")
        ))
    ),
    h5("Instructions: Type your text into the top left box, the three most likely next words, given the text inputted, will be displayed."),
    h5("Reference Links:"),
    a("Author: Anthony Lei  ", href = "https://www.linkedin.com/in/anthonylei", target="_blank"),    
    a("Github Source Code   ", href = "https://github.com/anthonylei/NextWordPrediction", target="_blank"),
    a("Documentations", href = "http://rpubs.com/hlei/nextWord", target="_blank")
))