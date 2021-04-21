library(sna)
library(NetData)
data(studentnets.mrqap173, package="NetData")

head(m173_sem1_FRN, 3)

m173_sem1_SSL <- as.matrix(m173_sem1_SSL)
m173_sem1_TSL <- as.matrix(m173_sem1_TSL)
m173_sem1_FRN <- as.matrix(m173_sem1_FRN)
m173_sem1_SEAT <- as.matrix(m173_sem1_SEAT)
m173_sem1_RCE <- as.matrix(m173_sem1_RCE)
m173_sem1_GND <- as.matrix(m173_sem1_GND)


m173_sem2_SSL <- as.matrix(m173_sem2_SSL)
m173_sem2_TSL <- as.matrix(m173_sem2_TSL)


predictor_matrices <- array(dim = c(6, length(m173_sem1_SSL[1,]),length(m173_sem1_SSL[1,])))

predictor_matrices[1,,] <- m173_sem1_SSL
predictor_matrices[2,,] <- m173_sem1_TSL
predictor_matrices[3,,] <- m173_sem1_FRN
predictor_matrices[4,,] <- m173_sem1_SEAT
predictor_matrices[5,,] <- m173_sem1_RCE
predictor_matrices[6,,] <- m173_sem1_GND

nl<-netlm(m173_sem2_SSL, predictor_matrices)
nlLabeled <- list()
nlLabeled <- summary(nl)
nlLabeled$names <- c("Intercept", "SSL1", "TSL1", "Friends", "Seat","Race","Gender")
nlLabeled$coefficients = round(nlLabeled$coefficients, 2)
nlLabeled


n2<-netlm(m173_sem2_TSL, predictor_matrices)

n2Labeled <- list()
n2Labeled <- summary(n2)
n2Labeled$names <- c("Intercept", "SSL1", "TSL1", "Friends", "Seat","Race","Gender")

n2Labeled$coefficients = round(n2Labeled$coefficients, 2)
n2Labeled


crr.app = qaptest(list(m173_sem2_SSL, predictor_matrices), gcor, g1=1, g2=2, reps = 1000)

crr.app

plot(crr.app)
