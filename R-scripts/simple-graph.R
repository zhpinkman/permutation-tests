library(sna)
library(statnet)


g = array(dim = c(4, 20, 20))
g[1,,] = rgraph(20)
g[2,,] = rgraph(20, tprob = g[1,,] * .8)
g[3,,] = rgraph(20, tprob = g[1,,] * .9)
g[4,,] = rgraph(20, tprob = g[1,,] * .7)


y = g[1,,] + 2 * g[2,,] + 4 * g[3,,]
z = rgraph(20)

nl = netlm(y, g)

summary(nl)

qap.results = qaptest(list(y, g), gcor, g1=1, g2=2, reps = 1000)

qap.results

qap.results[2]


nl1 = netlm(z, g)

summary(nl1)

qap.results1 = qaptest(list(z, g), gcor, g1=1, g2=2, reps = 1000)

qap.results1

plot(qap.results1)
