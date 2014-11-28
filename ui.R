shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Central Limit Theorem and the Law of Large Numbers"),
        sidebarPanel(
            numericInput('nObservations', 'Number of Poisson Observations: Range 20 to 400', 40, min = 20, max = 400),
            numericInput('lambda', 'Lamda: Range 0.2 to 0.9', 0.2, min = 0.1, max = 0.9),
            sliderInput('numSimulations', 'Number of Simulations', value = 300, min = 25, max = 2000, step = 25)
            #submitButton('Submit')
        ),
        mainPanel(
            h6('Note: The central limit theorem and the law of large numbers state that the distribution of the average of 
               a large number of independent, identically distributed variables will be approximately normal, 
               regardless of the underlying distribution.
               In this case, we use a Poisson distribution and simulate a large number of samples.'), 
            h6('Total Observations Per Simulation'),
            verbatimTextOutput("nObservations"),
            h6('Poisson Rate i.e. Lambda'),
            verbatimTextOutput("lambda"),
            h6('Total Number of Simulations'),
            verbatimTextOutput("numSimulations"),
            h6('Theoretical Mean of this Distribution: 1/lambda'),
            verbatimTextOutput("theoreticalMean"),
            h6('Note: Per the Central Limit Theorem and the Law of Large Numbers, notice that as we increase the number of simulations, the simulated mean converges towards the theoretical mean given below.'),
            plotOutput('newHist')
        )
    )
)
