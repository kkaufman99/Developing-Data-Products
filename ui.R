library(shiny)
shinyUI(
        navbarPage("Miles Per Gallon App",
                   tabPanel("Analyzer",
                            sidebarPanel(
                                    radioButtons(inputId="text1", label="Choose a variable to see its impact on MPG:",
                                                 choices=names(mtcars), selected="wt"),
                                    submitButton('Plot')
                            ),
                            mainPanel(
                                    h3('Plot of MPG in relation to'),
                                    verbatimTextOutput("text1"),
                                    plotOutput("plot")
                            )
                   ),
                   tabPanel("Predictor",
                            sidebarPanel(
                                    h4('The following values can be altered to predict the MPG:'),
                                    h5('(defaulted to mean values)'),
                                    numericInput('hp', 'Horsepower', mean(mtcars$hp)),
                                    numericInput('wt', 'Weight', mean(mtcars$wt)),
                                    numericInput('disp', 'Displacement', mean(mtcars$disp)),
                                    numericInput('qsec', '1/4 mile time', mean(mtcars$qsec)),
                                    submitButton('Predict')
                            ),
                            mainPanel(
                                    h3('Prediction of MPG'),
                                    verbatimTextOutput("prediction")
                            )
                   ),
                   tabPanel("About",
                            mainPanel(includeMarkdown("DDP_about.Rmd"))
                   )
        )
)