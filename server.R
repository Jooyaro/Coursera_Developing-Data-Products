#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
  model <- lm(Sepal.Width ~ Sepal.Length, data = iris)
  
  modelpred <- reactive({
    LengthInput <- input$Sepal.Length
    predict(model, newdata = data.frame(Sepal.Length = LengthInput))
  })
  
  output$plot <- renderPlot({
    LengthInput <- input$Sepal.Length
    
    plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Length",
         ylab = "Width", bty = "n", pch = 16,
         xlim = c(0, 20), ylim = c(0, 10))
    if(input$showModel){
      abline(model, col = "red", lwd = 2)
    }
    
    legend(25, 250, c("Model Prediction"), pch = 16,
           col = "red", bty = "n", cex = 1.2)
    points(LengthInput, modelpred(), col = "red", pch = 16, cex = 2)
  })
  output$pred <- renderText({
    modelpred()
  })
})
