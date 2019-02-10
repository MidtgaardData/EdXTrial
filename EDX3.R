set.seed(1993)
data("tissue_gene_expression")
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x
x <- x[, sample(ncol(x), 10)]

LDA_train <- train(x,y, method="lda",preprocessing = "scale")
LDA_train$results["Accuracy"]
LDA_train$finalModel
