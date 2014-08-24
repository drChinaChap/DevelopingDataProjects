shinyServer(function(input, output) {
    output$text1 <- renderText({
        input$goButton
        isolate(paste("np =", input$n*input$p, "and n(1-p) =", input$n*(1-input$p)))
    })
    output$plot1 <- renderPlot({
        par(mfrow=c(1,2),oma=c(0,0,0,0),mar=c(3,3,3,2),bty="n")
        input$goButton
        isolate(
        n <- input$n)
        isolate(p <- input$p)
        reps <- 100*n
        x <- rbinom(reps,n,p)
        mu <- n*p
        sigma2 <- n*p*(1-p)
        sdev <-sqrt(sigma2)
        Npdf <- dnorm(seq(0,n,0.1),mu,sdev)
        hist(x,breaks=seq(0,max(x)+1,1)-0.5,prob=T,right=F,main="",xlim=c(0,max(x)),
             ylim=c(0,max(Npdf)),mgp=c(2,0.5,0),cex=1.0)
        mtext(side=3,line=1,outer=F,paste("n = ",n,", p = ",p ,sep=""),cex=1.2)
        
        lines(seq(0,n,0.1),Npdf,lty=2,col="red")
        prob <- (1:reps - 0.5)/reps
        qqx <- qnorm(prob,mu,sdev)
        qqy <- quantile(x,prob)
        plot(qqx,qqy,xlab="Normal quantiles",ylab="binomial quantiles",
             ,mgp=c(2,0.5,0),cex=0.8)
        mtext(side=3,line=1.5,outer=F,"Normal Q-Q plot",cex=1.0)
        lines(qqx,qqx,lty=2)
    })
        
})    