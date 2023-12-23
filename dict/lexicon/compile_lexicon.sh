#!/bin/bash

$FESTPB/utils.source

#Compila o dicionário fonético convertido, para ser usado no Festival Speech Synthesis.

if [ $# = 0 ]
then
echo -e "Compilar dicionário convertido para ser usado no Festival Speech Synthesis.\nFaça compile_lexicon.sh help para receber ajuda."
exit 1
fi

if [ $# = help ]
then
echo -e "bash compile_lexicon.sh dicionário_convertido nome_do_dicionário_compilado.\nPara usar um dicionário gerando pelo annotator use annotator2raw_lexicon.sh"
exit 1
fi

if [ -e $1 ]
then
FILE_INPUT=$1
else
echo "Por favor, informe a localização do dicionário convertido!"
exit 1
fi 

if [ $2 = 0 ]
then
FILE_OUTPUT=$FILE_INPUT.out 
echo "Seu dicionário compilado será salvo em: $FILE_OUPUT"
else 
FILE_OUTPUT=$2
echo "Seu dicionário compilado será salvo em: $FILE_OUPUT"
fi 

echo "Compilando $FILE_INPUT.\n isso pode demorar algum tempo..."
$ESTDIR/../festival/bin/festival -b '(lex.compile "'$FILE_INPUT'" "'$FILE_OUPUT'")' 

if [ ! -e $FILE_OUPUT ]
then 
echo "Ocorreu um erro inesperado, por favor verifique que $FILE_INPUT seja um dicionário aceito pelo Festival Speech Synthesis.\n Caso for um dicionário feito usado Annotator, use o script annotator2raw_lexicon"
fi