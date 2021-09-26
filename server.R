library(shiny)

shinyServer(function(input,output){

    model1 <- lm(dist ~ speed, data = cars)

    model1pred <- reactive({
        speedInput <- input$sliderSpeed
        predict(model1, newdata = data.frame(speed = speedInput))
    })

    output$plot1 <- renderPlot({
        speedInput <- input$sliderSpeed

        plot(cars$speed, cars$dist, xlab = "Miles Per Gallon",
             ylab = "Distance to Stop (Feet)", xlim = c(0,25),
             ylim = c(0,120))
        abline(model1, col = "blue")
        points(speedInput, model1pred(), col = "blue")
    })
    output$pred1 <- renderText({
        model1pred()
    })
})
