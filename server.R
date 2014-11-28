library(ggplot2)

shinyServer(
    function(input, output) {
        output$nObservations <- renderPrint({input$nObservations})
        output$lambda <- renderPrint({input$lambda})
        output$numSimulations <- renderPrint({input$numSimulations[1]})
        
        output$theoreticalMean <- renderPrint({1/input$lambda})
        
        output$newHist <- renderPlot({
            set.seed(1)
            
            nosims = input$numSimulations [1]
            n = input$nObservations
            expLambda = input$lambda
            
            simulatedExpValues = replicate(nosims, rexp (n, expLambda))
            simulatedExponentialMeans = colMeans (simulatedExpValues)
            meanOfSimExpMeans = mean(simulatedExponentialMeans)
            varianceTheoretical = ((1/expLambda)/sqrt (n))^2
            varianceSimExponMeans = var (simulatedExponentialMeans)
            meanOfSimExpMeans + c(-1,1) * qt (0.975, n) * sd (simulatedExponentialMeans)
            
            plot.new()
            g <- ggplot(data.frame(simulatedExponentialMeans), aes(x = simulatedExponentialMeans)) + 
                ylab("Means of Simulated Poisson Values") + xlab("Simulation Number") +
                geom_histogram(alpha = 0.2, binwidth=0.3, colour = "black", aes(y = ..density..)) + geom_density()
            g + qqline (simulatedExponentialMeans)
            g + qqline (simulatedExponentialMeans, col=2)
        })
    }
)
