library(shiny)
library(ggplot2)

data(mtcars)
d <- mtcars[ , c("mpg", "hp", "wt", "disp", "qsec")]
fit <- lm(mpg ~ ., d)


mpgPred <- function(hp, wt, disp, qsec) {
        d2 <- data.frame(hp, wt, disp, qsec)
        pred <- predict(fit,newdata=d2)
        return(pred)
}

shinyServer(
  function(input, output) {
    output$text1 <- renderText({input$text1})
    output$plot <- renderPlot({
            x <- mtcars[ , "mpg"]
            y <- mtcars[ , input$text1]
            plot(x, y, pch = 16, col="blue", xlab="mpg", ylab=input$text1)
    })
    output$prediction <- renderPrint({mpgPred(input$hp, input$wt, input$disp, input$qsec)}) 
 }
)

