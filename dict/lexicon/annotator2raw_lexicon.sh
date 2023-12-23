#!/bin/bash

#Converter dicionário fonético gerado pelo Annotator em um formato compatível com Festival Speech Synthesis. Usado sed.

#Caso nenhum parâmetro foi informado
if [ $# = 0 ]
then
echo "Converter dicionário fonético gerado pelo annotator para o formato compatível compatível com Festival Speech Synthesis."
exit 1
fi

#Mostra mensagem de ajuda, caso o primeiro parâmetro for "help"
if [ $1 = help ]
then
echo "annotator2raw_lexicon.sh arquivo_gerado_pelo_annotator nome_do_novo_arquivo_em_formato_festival"
echo "Caso a saida não for definida: arquivo_gerado_pelo_annotator.raw"
exit 1
fi

#Se o arquivo informado pelo usuário existe define a variável FILE_INPUT. Se não, mostrar mensagem de erro.
if [ -e $1 ]
then
FILE_INPUT=$1
else
  echo "Por favor, informe a localização do dicionário gerado pelo Annotator!"
exit 1
fi

#Se o arquivo de saída não for definido, defini a vivariável FILE_OUTPUT como FILE_INPUT+.raw. Caso for definido, definir a variável FILE_OUTPUT. Ambas os casos, mostrar como será salvo o dicionário convertindo.
if [ ! $2 ]
then
FILE_OUTPUT=$FILE_INPUT.raw
echo "Seu dicionário convertindo será salvo em: $FILE_OUTPUT"
else
  FILE_OUTPUT=$2
echo "Seu dicionário convertindo será salvo em: $FILE_OUTPUT"
fi

#Copia arquivo definido pela variável FILE_INPUT, em um arquivo temporário. Para ser usado para processo de conversão.
cp $FILE_INPUT $FILE_OUTPUT.tmp

#Usar for para fazer o loop, em casa palavras que esteja na primeira coluna. Usar awk para isso.
for word in $(awk '{printf "\n"$1}' $FILE_INPUT); do

#Variável com a expressão de substituição.
#( "palavra" nil (
SED="( /$word/ nil ("

#Usar sed para fazer o substituição, usar essa expressão para evitar que a substituição ocorra em outras palavras que contenham a palavra que vai ser substruida.
#Exemplo: palavra é "a"
# A -> ( "A" nil
# aa -> ( "a" nil ( "a" nil ( = erro

sed -e "/$word/{s|$word|$SED|;:a;N;ba}" -i $FILE_OUTPUT.tmp
done

#Após executar a primeira parte da conversão, completar os parênteses em cada final da linha.
#Exemplo:
#( "palavra" nil ( para ( "palavra" nil (aqui fica a transcrição fonética))
SED_1="))"
sed -i "s|$|$SED_1|g" $FILE_OUTPUT.tmp

#Usar tr para subtrair as barras / por aspas " duplas. Usou // eu não achei como usar sem que o código/comando quebre e salvando para um novo arquivo com o dicionário pronto em fonético compatível com Festival Speech Synthesis.

tr '/' '"' < $FILE_OUTPUT.tmp > $FILE_OUTPUT

#Apagando o arquivo temporário.
rm $FILE_OUTPUT.tmp



#Referências para fazer esse script:

#https://pt.stackoverflow.com/questions/158102/utilizando-vari%C3%A1vel-com-o-comando-sed

#https://shell-script.yahoogrupos.com.narkive.com/SZ7Fh1rM/sed-troca-apenas-da-primeira-ocorrencia