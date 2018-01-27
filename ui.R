#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Mandelbrot set"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      #sca = 30
      sliderInput("sca",
                   "Scale factor:",
                   min = 1,
                   max = 100,
                   value = 1),
      #max_iter=50
      numericInput("max_iter", "Maximum iterations:", 25),
      #centx = -0.74
      numericInput("centx", "Center X:", -0.5),
      #centy = 0.15
      numericInput("centy", "Center Y:", 0.0),
      submitButton("Recalculate"),
      h6("NOTE: The server needs at least 60 seconds to recalculate the plot")

    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3("Plot of the Mandelbrot set"), 
      plotOutput("mandelPlot"),
      
      h3("Inputs and Outputs"),
      
      p("The program admits four parameters. The first is the scale factor which permits to zoom in to see more in detail the limits of the Mandelbrot set. The center X and center Y parameters allow centering the plot in different points. They are most useful in combination with the scale factor to watch different parts of the set more in detail. Finally, the maximum iteractions control the maximum number of iterations done to decide if a point corresponds to the set or not. It can be used to increase the level of detail when zooming to a small region of the set.")
      
      
    )
  )
))
