# ui.R

shinyUI(fluidPage(
    titlePanel("Checking Validity of Normal Approximation of Binomial Distribution"),
    
    sidebarLayout(
        sidebarPanel(helpText("Enter the two parameters for a Binomial distribution"),
                     numericInput("n", 
                                  label = "n (number of trials)", 
                                  value = 10,
                                  min=1),
                     numericInput("p",
                                  label = "p (probability of succes)", 
                                  value = 0.5,
                                  min=0,
                                  max=1),
                     actionButton("goButton", "Submit"),
                     helpText( "The histogram shows the density for the Binomial distribution, 
                               the curve is the probability density function for a normally
                               distributed random variable with mean np and variance np(1-p).
                               The closer the curve follows the histogram the better 
                               the approximation is.",
                                br(),
                                br(),
                                "Similarly, the closer the points in the 
                                Q-Q plot are to the line y=x the better the approximation is.")
                     ),
        mainPanel(
            textOutput("text1"),
            plotOutput("plot1")
            )
    )
))