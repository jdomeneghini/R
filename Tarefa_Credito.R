#TAREFA FINAL

#Testando taxa erro com NaiveBayes

#biblioteca a ser utilizada
library(e1071)

#leitura do arquivo
credito = read.csv(file.choose(), sep=";", header=T)
head(credito)
dim(credito)

#criando uma amostra para dividir meu modelo em 70% treino e 30% teste
amostra = sample(2,1000,replace = T, prob=c(0.7,0.3))
amostra

creditotreino = credito[amostra==1,]
creditoteste= credito[amostra==2,]

dim(creditotreino)
dim(creditoteste)

#criando o modelo
modelo= naiveBayes(CLASSE ~ ., creditotreino)
modelo

#classificando o modelo
predicao= predict(modelo, creditoteste)
predicao

confusao = table(creditoteste$CLASSE, predicao)
confusao

#calculando taxa de acerto
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaacerto #Mostrou uma taxa de acerto de 79%

#calculando taxa de erro
taxaerro=(confusao[2]+confusao[3])/sum(confusao)
taxaerro #Mostrou uma taxa de erro de 21%