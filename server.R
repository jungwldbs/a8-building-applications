library(shiny)
library(dplyr)
library(plotly)

# creates scatter plot of petal or sepal lengths or widths
# from user selected species from iris data
shinyServer(function(input, output) {
  output$irisPlot <- renderPlotly({
    
    # filter out rows from iris data with user selected species
    data <- filter(iris, Species == input$species)
    
    # create plot based on user selected input, either Sepal or Petal
    # renders scatterplot of lenght and width of user selected input
    if (input$sp == "Sepal") {
      plot_ly(data, 
              x = Sepal.Width, 
              y = Sepal.Length, 
              mode = "markers")
    } else {
      plot_ly(data, 
              x = Petal.Width, 
              y = Petal.Length, 
              mode = "markers")
    } 
    
    # give graph header and name x and y axis
    layout(title = paste("Scatterplot of", input$sp, "Lengths and Widths"),
           xaxis = list(title = paste(input$sp, "Widths")),
           yaxis = list(title = paste(input$sp, "Lengths")))
  })
})