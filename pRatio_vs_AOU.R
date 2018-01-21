setwd("~/GEOVIDE_OtherData/pRatio_AOU")
df1 <- read.csv(file = "pRatio_AOU_GAM.csv", header = TRUE, sep = ",")
df2 <- df1[order(df1$AOU),]


#the plot starts at the origin (0,0)
#par(xaxs="i", yaxs="i") 
png("pRatio_vs_AOU_011118.png", width = 7, height = 7, units = "in",
    pointsize = 12, res=300)

#par(mar=c(4,5,1,1),oma = c(3,1,0,0))
par(mar=c(4,5,.6,.6),oma = c(1.5,1.5,1,1))
#plot(df1$AOU, df1$ave.pRatio_update)

plot(df2$AOU[c(1:4,10,11,22,24,25,27,28)],df2$ave.pRatio_update[c(1:4,10,11,22,24,25,27,28)], 
     pch = 10, col = "red", xlim = c(-20, 140), cex = 2,
     xlab = expression(paste("AOU (", mu, "mol ", kg^-1, ")")),
     ylab = expression(paste(" "^210, "Po"[p], "/", ""^210, "Pb"[p],
                             " Activity Ratio")),
     cex.axis = 1.5,cex.lab = 1.5)
points(df2$AOU[c(6,7,9,12,13,15,16,18:21)],df2$ave.pRatio_update[c(6,7,9,12,13,15,16,18:21)],pch=21,
       col = "black", bg = "blue", cex = 2, lw = 1.5)
points(df2$AOU[c(8,14,17,23,26)], df2$ave.pRatio_update[c(8,14,17,23,26)],pch = 22, col = "black",
       bg = "green", cex = 2, lw = 1.5)
points(df2$AOU[29:38], df2$ave.pRatio_update[29:38], col = "red",bg = "white",
       pch = 10,cex = 2)
points(df2$AOU[c(39:40)], df2$ave.pRatio_update[c(39:40)],pch = 22, col = "black",
       bg = "green", cex = 2, lw = 1.5)
lm1 <- lm(df2$ave.pRatio_update[c(1:4, 6:28)] ~ df2$AOU[c(1:4, 6:28)])
abline(lm1, lwd = 2, col = 'black')

lm2 <- lm(df2$ave.pRatio_update[29:40] ~ df2$AOU[29:40])
abline(lm2, lwd = 2, col = "black")

abline(h = 1, col = "black", lty = 2)
abline(v = 30, col = "black", lw = 5)
text(88, 4.5, expression(paste("R"^2, " = 0.6, ", "p-value < 0.001")), col = "black", cex = 1.6)
text(88, 2.5, expression(paste("R"^2, " = 0.3, ", "p-value = 0.08")), col = "black", cex = 1.6)
legend('topright', legend = c(expression(paste("GA03")),
                             expression(paste("GA01")),
                             expression(paste("Other studies"))),
       pch = c(22,21,10),col = c("black","black","red"),
       pt.bg = c("green","blue","white"),text.col = c("green","blue","red"),cex = 1.7)
dev.off()


# df1 <- read.csv(file="pRatio_AOU_GAM.csv", header = TRUE, sep = ",")
# df2 <- df1[order(df1$AOU),]
# 
# png("pRatio_vs_AOU_1104.png", width = 7, height = 7, units = "in",
#     pointsize = 12, res=300)
# 
# par(mar=c(4,5,1,1),oma = c(3,1,0,0))
# 
# plot(df2$AOU[c(1:4, 6:28)],df2$ave.pRatio[c(1:4, 6:28)], pch = 16,
#      col = "blue",xlim = c(-20, 140), cex = 1.5,
#      xlab = expression(paste("AOU (", mu, "mol ", kg^-1, ")")),
#      ylab = expression(paste(" "^210, "Po"[p], "/", ""^210, "Pb"[p], 
#                              " activity ratio")),
#      cex.axis = 1.3,cex.lab = 1.3)
# points(df2$AOU[29:40], df2$ave.pRatio[29:40], col = "red",
#        pch = 15,cex = 1.5, lw = 1.5)
# lm1 <- lm(df2$ave.pRatio[c(1:4, 6:28)] ~ df2$AOU[c(1:4, 6:28)])
# abline(lm1, lwd = 2, col = 'blue')
# 
# lm2 <- lm(df2$ave.pRatio[29:40] ~ df2$AOU[29:40])
# abline(lm2, lwd = 2, col = "red")
# 
# abline(h = 1, col = "black")
# text(55, 5, expression(paste("R"^2, " = 0.6, ", "p-value < 0.001")), col = "blue", cex = 1.3)
# text(88, 1.7, expression(paste("R"^2, " = 0.3, ", "p-value = 0.08")), col = "red", cex = 1.3)
# 
# dev.off()