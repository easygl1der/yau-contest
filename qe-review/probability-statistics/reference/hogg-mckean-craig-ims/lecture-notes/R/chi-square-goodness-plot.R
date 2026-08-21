# Chi-square distribution for goodness-of-fit test illustration
# df = k-1 degrees of freedom, here k=6 (dice sides), df = 5

df <- 5
alpha <- 0.05

# Critical value (upper tail rejection region)
chi_crit <- qchisq(1 - alpha, df)  # chi^2_{alpha, df} = 11.07

# Create data for plotting
x <- seq(0, 30, length.out = 2000)
y <- dchisq(x, df)

# Working directory is already set to R folder

# Open PDF
pdf("chi-square-goodness.pdf", width = 8, height = 5)

# Set up plot
plot(x, y, type = "n", xlab = expression(chi^2 ~ value),
     ylab = "Density",
     main = expression(paste("Chi-square Distribution ", chi^2, "(5) for Goodness-of-Fit Test")),
     cex.main = 1)

# Acceptance region (left of critical value)
idx_accept <- x <= chi_crit
polygon(c(0, x[idx_accept], chi_crit),
        c(0, y[idx_accept], 0),
        col = rgb(0.3, 0.8, 0.6, 0.5), border = NA)

# Rejection region (right of critical value, shaded red)
idx_reject <- x >= chi_crit
polygon(c(chi_crit, x[idx_reject], max(x)),
        c(0, y[idx_reject], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

# Add curve line
lines(x, y, col = "black", lwd = 1.5)

# Add vertical line at critical value
abline(v = chi_crit, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1.5)

# Add text annotations
text(chi_crit, max(y)*0.4, sprintf("%.2f", chi_crit),
     srt = 90, adj = -0.2, cex = 0.9)

# Region labels
text(5, max(y)*0.75, "Acceptance\nRegion", cex = 1, col = rgb(0.1, 0.5, 0.3))
text(18, max(y)*0.75, expression(paste("Rejection Region ", H[0])),
     cex = 1, col = rgb(0.7, 0.1, 0.1))

# Alpha annotation
text(chi_crit + 2, max(y)*0.15,
     expression(paste(alpha, " = 0.05")),
     cex = 0.9, col = rgb(0.5, 0.1, 0.1))

# Add arrows and annotation for decision rule
text(24, max(y)*0.5,
     expression(paste("Reject H"[0], " if ", chi^2 > 11.07)),
     cex = 0.85, col = rgb(0.3, 0.3, 0.3))

# Close PDF
dev.off()

# Also save as PNG
png("chi-square-goodness.png", width = 8, height = 5, units = "in", res = 150)

plot(x, y, type = "n", xlab = expression(chi^2 ~ value),
     ylab = "Density",
     main = expression(paste("Chi-square Distribution ", chi^2, "(5) for Goodness-of-Fit Test")),
     cex.main = 1)

idx_accept <- x <= chi_crit
polygon(c(0, x[idx_accept], chi_crit),
        c(0, y[idx_accept], 0),
        col = rgb(0.3, 0.8, 0.6, 0.5), border = NA)

idx_reject <- x >= chi_crit
polygon(c(chi_crit, x[idx_reject], max(x)),
        c(0, y[idx_reject], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

lines(x, y, col = "black", lwd = 1.5)
abline(v = chi_crit, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1.5)

text(chi_crit, max(y)*0.4, sprintf("%.2f", chi_crit),
     srt = 90, adj = -0.2, cex = 0.9)

text(5, max(y)*0.75, "Acceptance\nRegion", cex = 1, col = rgb(0.1, 0.5, 0.3))
text(18, max(y)*0.75, expression(paste("Rejection Region ", H[0])),
     cex = 1, col = rgb(0.7, 0.1, 0.1))

text(chi_crit + 2, max(y)*0.15,
     expression(paste(alpha, " = 0.05")),
     cex = 0.9, col = rgb(0.5, 0.1, 0.1))

text(24, max(y)*0.5,
     expression(paste("Reject H"[0], " if ", chi^2 > 11.07)),
     cex = 0.85, col = rgb(0.3, 0.3, 0.3))

dev.off()

cat("Plot saved: chi-square-goodness.png\n")
cat(sprintf("df = %d, alpha = %.2f\n", df, alpha))
cat(sprintf("chi_crit (q(1-alpha,df)) = %.4f\n", chi_crit))
cat("Decision: Reject H0 if chi-square > 11.07\n")