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
  
  output$mandelPlot <- renderPlot({
    step=seq(-1.0,1.0,by=0.01)
    points=array(0,dim=c(length(step)^2,2))
    modmin = 4
    t=0
    for(a in step) {
      for(b in step) {
        x=0
        y=0
        n=0
        mod=0
        while(n<input$max_iter & mod<modmin) {
          n=n+1
          newx=a/input$sca+input$centx+x^2-y^2
          newy=b/input$sca+input$centy+2*x*y
          mod=newx^2+newy^2
          x=newx
          y=newy

        }
        
        if(mod<modmin) {
          t=t+1
          points[t,]=c(a/input$sca+input$centx, b/input$sca+input$centy)
        }
      }
    }
    
    df=as.data.frame(points)

    plot(df$V1,df$V2,type="p", pch=".",col="black",
         xlab="",ylab="",
         xlim=c(-1/input$sca+input$centx, 1/input$sca+input$centx),
         ylim=c(-1/input$sca+input$centy, 1/input$sca+input$centy))
  })
  

})
