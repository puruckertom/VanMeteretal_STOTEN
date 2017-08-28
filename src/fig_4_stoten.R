barplot(D, main="Mixed Pesticides", xlab = "Pesticide Treatment", ylab = "# of Significant Spectral Features", ylim = c(0,105), col="indianred", names.arg = c("ATZ", "MA", "PZ", "ATZMA", "ATZPZ", "MAPZ", "ATZMAPZ"), font.lab = 2, cex.names=0.75, cex.axis = 0.75, axis.lty=1)
D <- c(42, 89, 103, 22, 43, 53, 22)
barplot(C, main="Herbicides", xlab = "Pesticide Treatment", ylab = "# of Significant Spectral Features", ylim = c(0,70), col="indianred", names.arg = c("ATZ", "ME", "D", "ATZD", "ATZME", "MED", "ATZMED"), font.lab = 2, cex.names=0.75, cex.axis = 0.75, axis.lty=1)
C <- c(22, 15, 69, 38, 23, 36, 37)
