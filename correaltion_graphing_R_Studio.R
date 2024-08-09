install.packages("readxl")
install.packages("readxl")
install.packages("corrplot")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("reshape2")
library(readxl)
library(corrplot)
library(ggplot2)
library(reshape2)
data <- read_excel("D:/Data_Analysis_With_Python/Workspace/1.Correlation_matrics_analysis/Correlation_Points_90_90.xlsx")
# View the first few rows to understand the data structure
head(data)


# Remove any non-numeric columns, if necessary
data_numeric <- data[, sapply(data, is.numeric)]


# Calculate the correlation matrix
cor_matrix <- cor(data_numeric, use = "complete.obs", method = "pearson")

# View the correlation matrix
print(cor_matrix)


# Basic correlation plot
corrplot(cor_matrix, method = "color", tl.col = "black", tl.srt = 45)

# To save the plot
png("correlation_heatmap.png", width = 800, height = 600)
corrplot(cor_matrix, method = "color", tl.col = "black", tl.srt = 45)
dev.off()


library(corrplot)

# Basic correlation plot with values in the cells
corrplot(cor_matrix, method = "color", addCoef.col = "black", 
         tl.col = "black", tl.srt = 45)
