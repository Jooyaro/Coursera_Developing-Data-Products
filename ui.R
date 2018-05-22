#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("Sepal.Width from Sepal.Length"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("Sepal.Length", "What is the Sepal Length of the species?", 0, 10, value=1),
      checkboxInput("showModel", "Show/Hide Model", value = TRUE),
      submitButton('Submit')
    ),
    mainPanel(
      plotOutput('plot'),
      h3('Predicted Sepal.Width from Model :'),
      textOutput('pred')
    )
  )
))