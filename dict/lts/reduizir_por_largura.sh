#!/bin/bash

#Reduzir um dicionário convertido com base no tamanho das palavras.

if [ $# = 0 ]
then 
echo "Reduzir um dicionário fonético convertido com base no tamanho das palavras."
echo "Use bash reduizir_por_largura.sh help para mais informações."
exit 1
fi 

if [ $1 = help ]
then 
echo "bash reduizir_por_largura.sh nome_do_dicionário_convertido nome_do_dicionário_reduzindo largura"
echo -e "Avisos: Por padrão, a largura é definida como 4, o padrão vai ser usado caso a largura não for definida ao comando.\n Esse processo irá ocorrer em um thread, no futuro coloacarei suporte a multithered."
exit 1 
fi

if [ -e $1 ]
then
FILE_INPUT=$1
else
  echo "Por favor, informe a localização do ddicionário convertido"
exit 1
fi

if [ ! $# = 2 ]
then
FILE_OUTPUT="reduzindo_$FILE_INPUT"
echo "Seu dicionário será  salvo em $FILE_OUTPUT"
else
FILE_OUTPUT=$2
echo "Seu dicionário será  salvo em $FILE_OUTPUT"
fi

re='[0-9]'
if [ ! $# = 3 ]
then
LARGURA=4
else
if [[ ! $3 =~ $re ]]
then 
LARGURA=4
else
LARGURA=$3
fi
fi


for palavras in $(awk '{print $1}' < $FILE_INPUT | tr -d '"' | tr -d '('); do

CH=$(echo $palavras | wc -m)

if [ ! $CH -le $LARGURA ]
then
grep -w $palavras $FILE_INPUT >> $FILE_OUTPUT
echo "Palavra: $palavras com largura de $CH será salva em $FILE_OUTPUT"
fi 
done 