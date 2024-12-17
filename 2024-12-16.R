# nesta aula, vamos aprender como importar um conjunto de dados para o R

# antes de importar o conjunto, vamos definir o diretório de trabalho; o diretorio de trabalho é o local onde o R vai procurar os arquivos que vamos importar; para definirmos o diretorio de trabalho, vamos em Session -> Set Working Directory -> Choose Directory e selecionamos a pasta onde está o arquivo que queremos importar

# usaremos um conjunto de dados que contém informações sobre as vítimas de harold shipman; este arquivo este em formato txt e, por isso, vamos usar a função rea.table() para importar este arquivo; para usarmos esta função, precisaremos utilizar basicamente 3 argumentos: file, header e sep; o argumento file é o nome do arquivo que queremos importar; o argumento header é um valor lógico que indica se a primeira linha do arquivo contém os nomes das variáveis; o argumento sep é o separador de campos do arquivo; no caso do arquivo que vamos importar, seu nome é shipman_vitimas.txt, a primeira linha contém os nomes das variáveis (header = TRUE) e o separador de campos é a vírgula (sep = ",")

# na próxima linha, vamos importar o conjunto e armazená-lo em um objeto chamado vitimas; lembre-se que o nome de um objeto não pode conter espaços em branco, não pode começar com números e não pode conter caracteres especiais, como acentos, por exemplo

# para executar uma linha, você pode usar o comando Ctrl + Enter

vitimas <- read.table(file = "shipman_vitimas.txt", header = TRUE, sep = ",")

# depois de importamos o conjunto, podemos usar a função View() para visualizar o conjunto; esta função abre uma janela com o conjunto de dados

View(vitimas)

# para visualizar as primeiras linhas do conjunto, podemos usar a função head()

head(vitimas)

# para analisar a estrutura do conjunto, podemos usar a função str(); esta função nos mostra o tipo de cada variável, o número de observações e o número de variáveis

str(vitimas)

# a partir da análise da estrutura do conjunto, verificamos que o conjunto, por exemplo, posssui 215 observações, 10 variáveis; além disso, podemos ver os nomes das variáveis e os tipos de cada variável; a variável DateofDeath é chr, isto é, character (string); a variável gender foi importada como int; a variavel gender2 é character e assim por diante.

# a partir dessa primeira análise, percebemos que algumas variáveis foram importadas com o tipo errado; por exemplo, a variável PlaceofDeath é do tipo categórica, mas foi importada como character; uma variável categórica é uma variável que possui um número finito e não tão grande de valores (a variável Name não é categórica); como a variavel PlaceofDeath informa o local da morte da vítima, como em casa, no hospital, etc, ela é uma variável categórica; mais a frente, vamos corrigir o tipo desta variável

# a seguir, podemos usar a função summary() para obter um resumo das variáveis do conjunto; esta função nos mostra a média, o desvio padrão, o mínimo, o primeiro quartil, a mediana, o terceiro quartil e o máximo de cada variável numérica, exibe a frequencia de cada valor de uma variável categórica e mostra o número de valores faltantes de cada variável.

summary(vitimas)

# a partir do resumo, podemos ver que a idade mínima de uma vítima foi de 41 anos e que o primeiro quartil foi de 72 anos, isto é, 25% das vítimas tinham até 72 anos; a mediana foi de 77 anos, isto é, 50% das vítimas tinham até 77 anos; observe que a variável gender tem uma média de 0.17; isso não faz sentido, porque esta variavel não é numerica; os valores 0 e 1 foram utilizados apenas para representar mulheres e homens, respectivamente; iremos, mais a frente, corrigir o tipo desta variável.

# para acessarmos uma variável específica do conjunto, podemos usar o operador "$"; por exemplo, para acessarmos a variável Name, podemos usar vitimas$Name; a seguir, vamos imprimir a variavel PlaceofDeath.

vitimas$PlaceofDeath

# como discutimos anteriormente, a variável PlaceofDeath é categórica, mas foi importada como character; para identificarmos os valores únicos desta variável, podemos usar a função unique(); esta função retorna os valores únicos de uma variável

unique(vitimas$PlaceofDeath)

# como podemos ver, os valores únicos da variável PlaceofDeath são "Home", "Hospital", "Residential Home", "Shipman's surgery", "Nursing home" e "Residential home"; estas poucas opções indicam que esta variável é categórica; observe que duas das opções são iguais, mas com letras maiúsculas e minúsculas diferentes; isso pode ser um problema, pois o R considera letras maiúsculas e minúsculas como diferentes; para corrigirmos isso, podemos usar a função tolower(); esta função converte todas as letras de uma string para minúsculas

vitimas$PlaceofDeath <- tolower(vitimas$PlaceofDeath)

# agora, podemos finalmente converter a variável PlaceofDeath para o tipo fator; para isso, usamos a função as.factor() 

vitimas$PlaceofDeath <- as.factor(vitimas$PlaceofDeath)

# a seguir, vamos verificar se a variável PlaceofDeath foi convertida para o tipo fator a partir da função str() e da função summary()

str(vitimas)

summary(vitimas)

# na próxima aula, continuaremos a análise deste conjunto de dados e começaremos a aprender sobre visualização de dados