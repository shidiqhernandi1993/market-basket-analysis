library(Matrix)
library(arules)
library(grid)
library(arulesViz)
market=read.csv("E:\\Market Basket Analysis\\products.csv")
View(market)
head(market)
summary(market)
dim(market)
trans = as(split(market[,"department_id"], market[,"aisle_id"]),"transactions")
trans
itemFrequencyPlot(trans,type="absolute", topN=10)
summary(trans)
tabel = crossTable(trans, sort=TRUE)
tabel[1:5, 1:5]
rules = apriori(trans, parameter=list(supp=0.1, conf=0.2))
rules
inspect(sort(rules))
crossTable(trans,measure='lift', sort=T)[1:5,1:5]
plot(sort(rules, by="lift"), method="graph", control=list(type="items"))
plot(rules, interactive=TRUE)
