# Exemplo 1
x <- c(1:10)
x
x[(x>8) | (x<5)]
# 1 2 3 4 9 10
x <- c(1:10)
x
# 1 2 3 4 5 6 7 8 9 10
x > 8
# F F F F F F F F T T
x < 5
# T T T T F F F F F F
x > 8 | x < 5
#T T T T F F F F T T
x[c(T,T,T,T,F,F,F,F,T,T)]
# 1 2 3 4 9 10 
ls()
#[1] "x"
rm(x)
x
# Error: object 'x' not found
z2 <- c(1,2,3,4,5,6)
z3 <- c(6,8,3,5,7,1)
plot(z2,z3)
title("Meu primeiro diagrama de dispersao")
x = sin(9)/75
y = log(x) + x^2
x
# [1] 0.005494913
y
# [1] -5.203902
m <- matrix(c(1,2,4,1), ncol=2)
m
#     [,1] [,2]
# [1,]   1    4
# [2,]   2    1

getwd()
data()
search()

library(MASS)
shoes
library()

# Exemplo 2
lm(mpg~wt, data=mtcars)

# Exemplo 3
fit <- lm(mpg~wt, data=mtcars)
summary(fit)
plot(fit$residuals, fit$fitted.values)
plot(fit)

# Tipos de dados
## Vetores

a <- c(1,2,5.3,6,-2,4) # vetor numérico
a
b <- c("um","dois","três") # vetor de caracteres
b
c <- c (TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) # vetor lógico
c

a[c(2,4)] # 2º e 4º elementos do vetor

# gera matriz numérica 5 x 4 
y<-matrix(1:20, nrow=5,ncol=4)
y

# outro exemplo
celulas <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
minhamatriz <- matrix(celulas, nrow =2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))
minhamatriz

# Como extrair linhas, colunas ou elementos de matrizes:
y[,4] # 4ª coluna da matriz
y[3,] # 3ª linha da matriz
y[2:4,1:3] # linhas 2,3,4 das colunas 1,2,3

# Arrays

# Cria dois vetores
dados1 <- c(1,2,3,4,5,6,7,8,9,10,11,12)
dados2 <- c(13,14,15,16,17,18,19,20,21,22,23,24)
# passa esses vetores como entrada para o array
# 4 linhas, 2 colunas e 3 dimensões
arrayresultante <- array(c(dados1, dados2), dim = c(4,2,3))
print(arrayresultante)

# Dataframes
d <- c(1,2,3,4)
e <- c("vermelho", "branco", "amarelo", "azul")
f <- c(TRUE,TRUE,FALSE,FALSE)
meudataframe <- data.frame(d,e,f)
meudataframe
names(meudataframe) <- c("ID","Cor","Bool") # nomes das variáveis

meudataframe$Cor

# Listas
# exemplo de uma lista com 4 componentes
# uma string, um vetor numérico, uma matriz e um escalar 
lista1 <- list(nome="Fred", meusnumeros=d, matriz = minhamatriz, idade=53)
lista1
lista2 <- list(nome="Artur", meusnumeros=dados1, dataframe = meudataframe, idade=27)
lista2
# exemplo de uma lista contendo duas listas 
listamultipla <- c(lista1,lista2)
listamultipla
lista1[[2]] # 2º componente da lista

# Factors
# gênero variável com 20 entradas "masculinas" e  30 entradas "femininas" 
genero <- c(rep("masculino",20), rep("feminino", 30)) 
genero <- factor(genero) 
# R agora trata gênero como uma variável nominal 
summary(genero)
class(genero)

# Importação de dados no R
# csv

dadoscsv <- read.table("C:/Users/plb2/Pessoal/Doutorado/Periodos/20241/AulaEstagioDocencia/Aula-16052024/mydata.csv", header=TRUE, sep=",")
dadoscsv

# Excel

library(readxl)
dadosxlsx <- read_excel("C:/Users/plb2/Pessoal/Doutorado/Periodos/20241/AulaEstagioDocencia/Aula-16052024/mydata.xlsx")
dadosxlsx

# lista objetos no ambiente de trabalho 
ls()
# lista as variáveis em mydata
names(dadosxlsx)
# lista a estrutura de mydata 
str(dadosxlsx)
# dimensões de um objeto 
dim(dadosxlsx)

# classe de um objeto (numérico, matriz, dataframe, etc) 
class(dadoscsv)
# imprime mydata
print(dadosxlsx)
# imprime as primeiras 3 linhas de dadosxlsx
head(dadosxlsx, n=3)
# imprime as últimas 2 linhas de dadoscsv
tail(dadoscsv, n=2)

# Missing data

y <- c(1,2,3,NA)
is.na(y) # retorna um vetor (F F F T)

x <- c(1,2,NA,3)
x
mean(x) # retorna NA
mean(x, na.rm=TRUE) # retorna 2

# Completar os valores NA com zeros
x[is.na(x)] <- 0
x[is.na(x)] <- mean(x, na.rm=TRUE)
x

# Datas no R
# use as.Date() para converter strings em datas
minhasdatas <- as.Date(c("2007/06/22", "2004/02/13"))
minhasdatas
class(minhasdatas)
# número de dias entre 22/06/07 e 13/02/04 
minhasdatas[1]
minhasdatas[2]
dias <- minhasdatas[1] - minhasdatas[2]
dias
class(dias)

Sys.Date( ) # retorna a data de hoje
date() # retorna a data e hora atuais

hoje <- Sys.Date()
hoje
format(hoje, format="%B %d %Y") #"maio 16 2024"

# Manipulando dados com R
# Criando novas variaveis
dadoscsv
dadoscsv$IMC<-dadoscsv$Peso/(dadoscsv$Altura/100)^2
dadoscsv

names(dadoscsv) <- c("Gender","Age","Weight", "Height", "BMI")
dadoscsv

# Estruturas de controle
# Exemplo: Transpor uma matriz

transpor <- function(x){
  if (!is.matrix(x)){
    warning("argumento não é uma matriz: retornando NA")
    return(NA_real_)
  }
  y <- matrix(1, nrow=ncol(x), ncol=nrow(x))
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      y[j,i] <- x[i,j]
    }
  }
  return(y)
}

z <- matrix(1:10, nrow=5, ncol=2)
z
tz <- transpor(z)
tz

## Funções estatísticas

# plot standard normal curve
x <- pretty(c(-3,3), 30)
# função pretty: Calcule uma sequência de cerca de n+1 valores arredondados igualmente espaçados que cobrem o intervalo dos valores em x
y <- dnorm(x)
plot(x, y, type='l', xlab="Normal Deviate", ylab="Density", yaxs="i")

pnorm(1.96)

qnorm(.95)

# 50 variáveis aleatórias normalmente distribuídas com mean=50, sd=10
x <- rnorm(50, m=50, sd=10)

# probabilidade de 0 a 5 caras de moeda honesta em 10 lançamentos
dbinom(0:5, 10, .5)

# probabilidade de 5 ou menos caras de moeda honesta em 10 lançamentos
pbinom(5, 10, .5)

# probabilidade de 0,1 ou 2 eventos com lambda=4
dpois(0:2, 4)

# probabilidade de pelo menos 3 eventos com lambda=4
1- ppois(2,4)

# 10 variáveis aleatórias uniformes
x <- runif(10)
x

# Ordenação de dados no R

dadoscsv
# ordenando os dados pelas idades
dadoscsvsorted = dadoscsv[order(dadoscsv$Age),]

dadoscsvsorted

# Merge
dadoscsv$ID = c(1,2,3,4,5)
dadoscsv

novosdados <- read.table("C:/Users/plb2/Pessoal/Doutorado/Periodos/20241/AulaEstagioDocencia/Aula-16052024/newdata.csv", header=TRUE, sep=",")

novosdados

dadoscompletos <- merge(dadoscsv,novosdados,by="ID")

dadoscompletos

# Adicionando linhas com rbind

write.table(dadoscompletos, file = "C:/Users/plb2/Pessoal/Doutorado/Periodos/20241/AulaEstagioDocencia/Aula-16052024/dadoscompletos.csv", sep = ",")

novodado <- read.table("C:/Users/plb2/Pessoal/Doutorado/Periodos/20241/AulaEstagioDocencia/Aula-16052024/novodado.csv", header=TRUE, sep=",")

novodado

dadosmaiscompletos<-rbind(dadoscompletos,novodado)

dadosmaiscompletos

## Gráficos

# Pie Chart

# Criando os dados para o gráfico
x <- c(21, 62, 10, 53)
labels <- c("Londres", "Nova Iorque", "Singapura","Mumbai")
# Plotando o gráfico de pizza
pie(x,labels)

# Bar Chart
# Criando os dados para o gráfico
H <- c(7,12,28,3,41)
M <- c("Mar","Abr","Mai","Jun","Jul")

# Plotando o gráfico de barras
barplot(H, names.arg = M ,xlab = "Meses",ylab = "Receita",col = "blue", main = "Gráfico de Barras da Receita",border = "red")

# Boxplot
input <- mtcars[,c('mpg','cyl')]

print(head(input))

# Plotando o boxplot
boxplot(mpg ~ cyl, data = mtcars, xlab = "Número de cilindros", ylab = "Milhas por galão", main = "Dados de quilometragem")

# Histograma
x <- rnorm(10000, m=0, sd=1)
hist(x)

# Gráfico de linha
# Criando os dados para o gráfico
v <- c(7,12,28,3,41)

# Plotando o gráfico de linha
plot(v,type = "o", col = "red", xlab = "Mês", ylab = "Quantidade de chuva", main = "Gráfico da quantidade de chuva")

# Gráfico de linha com múltiplas linhas
t <- c(14,7,6,19,3)

lines(t, type = "o", col = "blue")

# Scatter Plots
input <- mtcars[,c('wt','mpg')]
print(head(input))

# Esboçando o diagrama de dispersão para carros com peso entre 2,5 a 5 e quilometragem entre 15 e 30

plot(x = input$wt,y = input$mpg,
     xlab = "Peso",
     ylab = "Milhagem",
     xlim = c(2.5,5),
     ylim = c(15,30),
     main = "Peso vs Milhagem"
)

## Matriz de diagramas de dispersão

pairs(~wt+mpg+disp+cyl,data = mtcars,main = "Matriz Scatterplot")
