#!/bin/bash

#Baixar dicionário fonético feito pelo Falabrasil.

if [ -e lexicon.utf8.dict.gz ]
then
gzip -d lexicon.utf8.dict.gz
else
if [ ! -e lexicon.utf8.dict ]
then
wget https://gitlab.com/fb-nlp/nlp-resources/-/raw/master/res/lexicon.utf8.dict.gz?ref_type=heads&inline=false
gzip -d lexicon.utf8.dic.gz
fi
fi

echo "Deseja converter o dicionário do Falabrasil para um novo dicionário compatível com Festival Speech Synthesis?"
echo "s para sim e n para não"
read resposta

if [ $resposta = "s" ]
then
bash annotator2raw_lexicon.sh lexicon.utf8.dict
else
exit 0
fi
