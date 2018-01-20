setwd("~/GEOVIDE_OtherData")
require(xlsx)
df=read.xlsx("Micro_nano_pico_composition_1023.xlsx", sheetName = "Sheet2")


png("Micro_nano_pico_fraction_1023.png", width = 7, height = 7, units = "in",
    pointsize = 12, res=300)

par(mar=c(4,5,1,1),oma = c(3,1,0,0))

x = c(1:11)
plot(x, df$fmicro, type = "b", xaxt="n",ylim = c(0,1),cex = 1.5,
     pch = 15,col = "blue",
     xlab = "Station", ylab = expression(paste("Fraction of phytoplankton")),
     cex.axis = 1.2, cex.lab = 1.3)

points(x, df$fnano, type = "b", pch = 16,cex = 1.5, col = "black")

points(x,df$fpico, type = "b", pch = 18,cex = 1.5, col = "red")
axis(1, at=1:11, labels = c("77", "69", "64", "60","44","38","32","26",
                            "21","13", "1"), cex.axis = 1.3)
abline(v = 5.6, col = 'darkgreen',lty = 3, lw = 4)

# par(new=T)
# plot(x[1:5],df$AvePP[1:5], axes = F, xlab = NA, ylab=NA, cex = 1.2)
# points(x[6:11], df$AvePP[6:11], col = "yellow", cex = 1.2)

legend('topright', legend = c(expression(paste("f"[micro])),
                             expression(paste("f"[nano])),expression(paste("f"[pico]))),
       pch = c(15,16,18), col = c("blue","black","red"), cex = 1.5)
text(4, 0.98, "Western", col = "black", cex = 1.5)
text(7, 0.98, "Eastern", col = "black", cex = 1.5)


dev.off()