set.seed(30)

# Decision Tree # loanapproved = age + job + house + credit
loanapproved = sample(x=c('Yes','No'), size=50, replace=T)
age = runif(50,30,60)
house = sample(x=c('Yes','No'), size=50, replace=T, prob=c(.4,.6))
job = sample(x=c('Yes','No'), size=50, replace=T, prob=c(.6,.4))
credit = ceiling(rnorm(50,100, 10))
loan = data.frame(loanapproved, age,job,house, credit)

loan_tree = rpart(loanapproved ~ ., data=loan)
loan_tree
rpart.plot(loan_tree)
rpart.plot(loan_tree,  type = 4,fallen.leaves = T, cex = 0.6)
rpart.plot(loan_tree,type=2, extra=104, cex=1, tweak=1, under=T, shadow=c('brown', 'green','red'), nn=T)

guy1 = data.frame(age=45, house = 'No', job = "Yes", credit = 90)
predict(loan_tree, guy1)
predict(loan_tree, guy1, type = 'class')

guys = data.frame(age=c(45,30), house = c('No','Yes'), job = c("Yes","No"), credit = c(90,100))
p1=predict(loan_tree, guys, type = 'class')
p2=predict(loan_tree, guys, type = 'prob')
cbind(guys,p1,p2)

printcp(loan_tree)
