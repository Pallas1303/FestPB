#!/bin/bash

#Fonte original: http://festvox.org/do_install

chmod +x scripts/*
mkdir ../tts_utils/
cd ../tts_utils

# Ubuntu (and related) prerequisites:
echo "Instalando os pacotes necessários para as ferramentas"
sleep 2

sudo apt-get install git build-essential libncurses5-dev sox cmake openjdk-8-jdk openjdk-8-jre
sudo apt-get install csh doxygen xsltproc graphviz xargs cut 

# Get source (unstable)
echo "Baixado e compilado: Festival Speech Synthesis, Speech Tools, Festvox, Flite e SPTK"
git clone http://github.com/festvox/speech_tools
git clone http://github.com/festvox/festival
git clone http://github.com/festvox/festvox
git clone http://github.com/festvox/flite

wget http://festvox.org/packed/SPTK-3.6.tar.gz
tar zxvf SPTK-3.6.tar.gz

export ESTDIR=`pwd`/speech_tools
export FLITEDIR=`pwd`/flite
export FESTVOXDIR=`pwd`/festvox
export SPTKDIR=`pwd`/SPTK

# Compile source
mkdir SPTK
patch -p0 <festvox/src/clustergen/SPTK-3.6.patch 
cd SPTK-3.6
./configure --prefix=$SPTKDIR
make
make install
cd ..

cd speech_tools
./configure
make
make all
cd ..

cd festival
./configure
make
make default_voices
cd ..

cd festvox
./configure
make
cd ..

cd flite
./configure
make
cd ..

#Baixar REAPER e annotador(G2P para português Brasileiro)

#Fazer download e compilar REAPER
echo "Fazer download REAPER do repertório Github"
sleep 2
git clone https://github.com/google/REAPER.git

#Compilar REAPER
echo "Compilar REAPER"
cd REAPER
mkdir build
cd build
cmake ..
make
cd ../../
echo "REAPER baixado e compilador com sucesso"
sleep 2

#Baixar annotator (GP2 - Grafeme to Phoneme para idioma português brasileiro)
echo "Baixado repositório do Annotator"
sleep 2
git clone https://github.com/falabrasil/annotator

## Salva as variáveis das ferramentas em um arquivo
echo "ESTDIR=$ESTDIR" >> utils.source
echo "FLITEDIR=$FLITEDIR" >> utils.source
echo "FESTVOXDIR=$FESTVOXDIR" >> utils.source
echo "SPTKDIR=$SPTKDIR" >> utils.source
echo "REAPER=`pwd`/REAPER/build/reaper" >> utils.source
echo "G2P_PB=`pwd`/annotator/fb_nlplib.jar" >> utils.source



