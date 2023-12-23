#!/bin/bash

#Teinar modelo LTS (Letter to Sound)
source ../scripts/utils.source

if [ $# = 0 ]
then 
echo "Treinar um modelo LTS (Letter to Sound) a partir de um dicionário fonético convertindo."
echo "Faça lts.sh help para saber mais."
fi

if [ $1 = help ]
echo "bash lts.sh nome_do_dicionário_convertido"
echo -e "Avisos: O script criará uma pasta lts_+nome_do_dicionário_convertido com modelo LTS criado usado o dicionário fornecido.\nUsado esse script com uma pasta já existente, todo o conteúdo será substituído e reescrito.\nTenha cuidado ao usar esse script."
fi

if [ -e $1 ]
then
FILE_INPUT=$1
else
echo "Por favor, informe a localização do dicionário convertido!"
exit 1
fi 

LTS="lts_$FILE_INPUT"

if [ -d $LTS ]
then
echo "Existe uma pasta com o mesmo nome do seu dicionário. Isso fará que o conteúdo dessa pasta seja substituído e reescrito."
echo "Deseja continuar isso? [s para sim, n para não]"
read -p resposta
if [ $resposta = "n" ]
then
exit 1
else
echo "Limpando a pasta $LTS, para evitar erros no processo de treinamento..."
rm $LTS -rf
fi

mkdir $LTS
echo "Copiando $FILE_INPUT para $LTS, com fins de isolamento." 
sleep 4
cp $FILE_INPUT $LTS

cd $LTS/
../scripts/build_lts setup $FILE_INPUT utf8
./build_lts "make_allowables" 
./build_lts 

cd ../

echo "Seu modelo LTS treinado a partir do dicionário $FILE_INPUT está em $LTS/lex_lts_rules.scm" 
