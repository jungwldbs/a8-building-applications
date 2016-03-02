library(shiny)
library(plotly)
library(dplyr)


shinyUI(fluidPage(
  
  # page title
  titlePanel("Iris"),
  
  # select box widget for each species
  selectInput("species", label = "Select Species",
              choices = list("setosa", "versicolor", "virginica"),
              selected = "setosa"),
  
  # Radio buttons widget for data set of interest
  # either Sepal or Petal
  radioButtons("sp", label = "select data set of interest", 
               choices = list("Sepal", "Petal"),
               selected = "Sepal"),
  
  # render plot
  mainPanel(
    plotlyOutput("irisPlot")
  )
))