Data Products: Project
========================================================
author: Coursera Student
date: Tuesday, November 18, 2014

Central Limit Theorem & Law of Large Numbers

Central Limit Theorem
========================================================

- The central limit theorem and the law of large numbers are the two fundamental theorems of probability. 
- Roughly, the central limit theorem states that the distribution of the sum (or average) of a large number of independent, identically distributed variables will be approximately normal, regardless of the underlying distribution. 
- The importance of the central limit theorem is hard to overstate; indeed it is the reason that many statistical procedures work.

Central Limit Theorem - Example
========================================================
- Consider a Poisson distribution with a mean (i.e. Lambda of 0.2) and a sample size of 40. 
- The theoretical mean is 1/0.2 = 5. 

The theorem states that if we sample 40 observations from any distribution numerous times and take their mean, the resulting distribution of these mean's would be normal. 


```r
nosims = 1000; n = 40; expLambda = 0.2

simulatedExpValues = replicate(nosims, rexp (n, expLambda))
simulatedExponentialMeans = colMeans (simulatedExpValues)
meanOfSimExpMeans = mean(simulatedExponentialMeans)
```

Central Limit Theorem - Plot
========================================================
For 10 simulations, notice that the plot is not normal. 


![plot of chunk unnamed-chunk-3](DevDataProducts_CourseProject2-figure/unnamed-chunk-3-1.png) 

Central Limit Theorem - Plot (Cont'd.)
========================================================
For 1000 simulations however, notice that the plot is normal.


![plot of chunk unnamed-chunk-5](DevDataProducts_CourseProject2-figure/unnamed-chunk-5-1.png) 

Central Limit Theorem - Plot R Code
========================================================
For reference, here is the R code to produce the plot.

```r
par (mfrow = c(1,1))
g <- ggplot(data.frame(simulatedExponentialMeans), aes(x = simulatedExponentialMeans)) + 
    ylab("Means of Simulated Poisson Values") + xlab("Simulation Number") +
    geom_histogram(alpha = 0.2, binwidth=0.3, colour = "black", aes(y = ..density..)) + geom_density()
g
```