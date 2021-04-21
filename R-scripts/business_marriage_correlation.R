library(sna)
library(network) 
library(ergm)
data(florentine)
detach("package:ergm")
library(sna)

flobusiness; flomarriage 

plot(flobusiness)

plot(flomarriage)

gcor(flomarriage,flobusiness)

flo.qap <- qaptest(list(flomarriage,flobusiness), gcor, g1=1, g2=2, reps=1000)

flo.qap

plot(flo.qap)


nl = netlm(flobusiness, flomarriage, reps = 1000)

summary(nl)


