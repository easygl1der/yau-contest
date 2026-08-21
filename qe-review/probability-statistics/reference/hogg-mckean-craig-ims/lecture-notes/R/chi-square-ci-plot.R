# Chi-square distribution for variance CI illustration (base R)
# df = n-1 degrees of freedom, here n = 20, df = 19

df <- 19
alpha <- 0.05

# Critical values
chi_lower <- qchisq(1 - alpha/2, df)  # chi^2_{1-alpha/2, df}
chi_upper <- qchisq(alpha/2, df)      # chi^2_{alpha/2, df}

# Create data for plotting
x <- seq(0, 55, length.out = 2000)
y <- dchisq(x, df)

# Open PDF
pdf("chi-square-ci.pdf", width = 8, height = 5)

# Set up plot
plot(x, y, type = "n", xlab = expression(chi^2 ~ value),
     ylab = "Density", main = expression(paste("Chi-square Distribution ", chi^2, "(", df, ")")))

# Confidence interval region (between critical values)
idx_ci <- x >= chi_lower & x <= chi_upper
polygon(c(chi_lower, x[idx_ci], chi_upper),
        c(0, y[idx_ci], 0),
        col = rgb(0.3, 0.8, 0.6, 0.5), border = NA)

# Lower tail region
idx_low <- x <= chi_lower
polygon(c(0, x[idx_low], chi_lower),
        c(0, y[idx_low], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

# Upper tail region
idx_high <- x >= chi_upper
polygon(c(chi_upper, x[idx_high], max(x)),
        c(0, y[idx_high], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

# Add curve line
lines(x, y, col = "black", lwd = 1.5)

# Add vertical lines at critical values
abline(v = chi_lower, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1)
abline(v = chi_upper, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1)

# Add text annotations
text(chi_lower, max(y)*0.35, sprintf("q(1-a/2,df) = %.2f", chi_lower),
     srt = 90, adj = 1.3, cex = 0.85)
text(chi_upper, max(y)*0.35, sprintf("q(a/2,df) = %.2f", chi_upper),
     srt = 90, adj = -0.1, cex = 0.85)

# Region labels
text(10, max(y)*0.85, "Rejection\n(alpha/2)", cex = 0.9, col = rgb(0.7, 0.1, 0.1))
text(42, max(y)*0.85, "Rejection\n(alpha/2)", cex = 0.9, col = rgb(0.7, 0.1, 0.1))
text(24, max(y)*0.65, "Confidence\nRegion (1-a)", cex = 0.9, col = rgb(0.1, 0.5, 0.3))

# Close PDF and save PNG
dev.off()

# Also save as PNG using ghostscript or just re-plot
png("chi-square-ci.png", width = 8, height = 5, units = "in", res = 150)

plot(x, y, type = "n", xlab = expression(chi^2 ~ value),
     ylab = "Density", main = expression(paste("Chi-square Distribution ", chi^2, "(", df, ")")))

idx_ci <- x >= chi_lower & x <= chi_upper
polygon(c(chi_lower, x[idx_ci], chi_upper),
        c(0, y[idx_ci], 0),
        col = rgb(0.3, 0.8, 0.6, 0.5), border = NA)

idx_low <- x <= chi_lower
polygon(c(0, x[idx_low], chi_lower),
        c(0, y[idx_low], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

idx_high <- x >= chi_upper
polygon(c(chi_upper, x[idx_high], max(x)),
        c(0, y[idx_high], 0),
        col = rgb(1, 0.4, 0.4, 0.6), border = NA)

lines(x, y, col = "black", lwd = 1.5)
abline(v = chi_lower, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1)
abline(v = chi_upper, lty = 2, col = rgb(0.2, 0.2, 0.2, 0.8), lwd = 1)

text(chi_lower, max(y)*0.35, sprintf("q(1-a/2,df) = %.2f", chi_lower),
     srt = 90, adj = 1.3, cex = 0.85)
text(chi_upper, max(y)*0.35, sprintf("q(a/2,df) = %.2f", chi_upper),
     srt = 90, adj = -0.1, cex = 0.85)

text(10, max(y)*0.85, "Rejection\n(alpha/2)", cex = 0.9, col = rgb(0.7, 0.1, 0.1))
text(42, max(y)*0.85, "Rejection\n(alpha/2)", cex = 0.9, col = rgb(0.7, 0.1, 0.1))
text(24, max(y)*0.65, "Confidence\nRegion (1-a)", cex = 0.9, col = rgb(0.1, 0.5, 0.3))

dev.off()

cat("Plot saved: chi-square-ci.png\n")
cat(sprintf("df = %d, alpha = %.2f\n", df, alpha))
cat(sprintf("chi_lower (q(1-alpha/2,df)) = %.4f\n", chi_lower))
cat(sprintf("chi_upper (q(alpha/2,df)) = %.4f\n", chi_upper))
