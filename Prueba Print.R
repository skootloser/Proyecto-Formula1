#inserción de data frame en Rstudio
library(readxl)
library(dplyr)

# Se incluyen varias datas de la data sqlite

file.choose() #Código para encontrar el archivo .xlsx de las datas

circuits <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  1)
constructor_results  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  2)
constructor_standings  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  3)
constructors  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  4)
driver_standings  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  5)
drivers  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  6)
laptimes  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  7)
pitstops  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  8)
qualifying  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  9)
races  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  10)
results  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  11)
seasons  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  12)
status  <- read_excel("C:\\Users\\Abraham\\Desktop\\UCV\\SQL UCV\\Formula 1 Proyecto\\Formula 1 Data.xlsx" , sheet =  13)
