#!/bin/bash

#Gerar um dicionário fonético a partir de uma lista de palavras usado o Annotator. Para ser usado em outros scripts.
source $FESTPB/tts_utils/utils.source

if [ $# = 0 ]
then
echo "Gerar dicionário fonético a partir de uma liata de palavras usado Annotator."
echo "Use list2annotator.sh help para mais informações."
exit 1
fi

if [ $1 = help ]
then
echo "bash list2annotator.sh lista_de_ppalavra nome_do_lexicon_de_saida numero_de_threads"
echo -e "Avisos: O arquivo com a lista de palavras devem ser em codificação UTF-8.\nCaso houve um arquivo com mesmo nome do nome_do_lexicon_de_saida esse arquivo será reescrito.\nCaso o número for igual á 0 ou não informado, será processando como 1"
exit 1
fi

if [ -e $1 ]
then
FILE_INPUT=$1
else
echo "Por favor, informe a localização da lista de palavras."
exit 1
fi 

if [ ! $2 ]
then
FILE_OUTPUT=$FILE_INPUT.dic 
echo "Seu dicionário será salvo em: $FILE_OUTPUT"
else 
FILE_OUTPUT=$2
echo "Seu dicionário será salvo em: $FILE_OUTPUT"
fi 

re='[0-9]'
NPROC=$(nproc)
if [[ ! $3 =~ $re ]]
then
CPUS=1 
echo $3 $CPUS 
else 
if [[ ! $3 < $NPROC ]]
then
echo "Você definiu um número muito maior de threads. Defindo automáticamente para 1."
CPUS=1
else
CPUS=$3
fi
fi 

echo "Gerando dicionário fonético usado Annotator. Caso o número de threads ser maior que 1, o processamento será feito em parallel"

java -jar $G2P_PB -i $FILE_INPUT -o $FILE_OUTPUT -g -t $CPUS

echo "Dicionário fonético em formato Annotator salvo em $FILE_OUPUT"

