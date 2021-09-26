library(shiny)

shinyUI(fluidPage(
    titlePanel("TItle"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderSpeed", "What is the MPH of the car?",5,25,value = 0),

        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted distance for a car to successfully stop in feet."),
            textOutput("pred1")
        )
    )
))
