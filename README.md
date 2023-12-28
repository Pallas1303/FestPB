FestPB é um projeto com objetivo de oferecer suporte ao Português Brasileiro ao software Text-to-Speech Festival Speech Synthesis. Com opções de baixar pacotes de vozes.

**Conteúdo da página**

* [Tutorial](#tutorial)
* [Sobre dicionário e fonemas usados.](#sobre-dicionário-e-fonemas-usados)
* [Recados Importantes](#recados-importantes)
* [To-Do](#to-do)
     * [Tokenização](#tokenização)

**Rescursos disponíveis no momento:**
- Script para construção de dicionário do idioma Português Brasileiro.
- Scripts para construção de modelos LTS (Lettng to Sound - Letras para Som) para Festival Speech Synthesis.
- PhoneSet com fonemas do Português Brasileiro.
- Script para geração de pitchmarck usado [REAPER](https://github.com/google/REAPER) 
- Script para construção desses seguintes programas (Festvox, Festival, Speech Tools e REAPER) e instalação de um G2P. 
- G2P usado [Annotator](https://github.com/falabrasil/annotator)
- Arquivos para o suporte de fonemas do português brasileiro ao Festival Speech Synthesis. 

## Tutorial

Aqui tem um tutorial básico de como fazer o download do repositório e instalação das ferramentas. 

**Clone o repositório e entre em seu diretório:**
```bash
git clone https://github.com/Pallas1303/FestPB
cd FestPB
```

**Aviso:** A instalação são para distribuições baseadas em Debian.

**Executar instalação das ferramentas:**
```bash
bash scripts/make_tts_utils.sh
```
##  Sobre dicionário e fonemas usados.

Dicionário fonético e fonemas são fornecidos pelo grupo Falabrasil com seu software G2P chamado annotator. Os fonemas estão em codificação UTF-8.

Para construção do Phoneset foi usado como base o seguinte artigo: "Síntese de Fala em Português Brasileiro Baseada em
Modelos Ocultos de Markov" feito por Carlos Francisco Soares de Souza. 

Houve algumas pesquisas, mas as suas fontes estão perdidas. As características fonéticas dos fonemas marcadas no Phoneset podem estar incorretas em algumas partes. 

Caso houve erros, por favor faça uma contribuição 
## Recados Importantes

**No seguinte momento não á:**
- Tutorial ou mesmo documentação para construir/instalar uma voz em português brasileiro. Sendo necessário conhecimento e familiaridade com Festival Speech Synthesis.
- Conversão de números, emojis e símbolos.
- Sem modelo POS Tagging em português brasileiro para Festival Speech Synthesis.
- Scripts para construção automática de vozes. 
- Sem vozes de outros bancos de dados conhecidos. 
- Sem *stress* ao dicionário fonético. 

As vozes disponíveis aqui para fazer o download foram construídas usado o método concatenativo "Unit Selection". Podem oferecer qualidades, mas em alguns casos pode haver falhas na geração de fala. No momento o meu ambiente de desenvolvimento não tem capacidade computacional para tarefas mais grandes como a construção de vozes com o método "Statistical Parametric Speech Synthesis" baseada em modelos HMM e construção de modelo LTS robusto.

Ficarei feliz em receber qualquer apoio disponível para esse projeto. Como correção de problemas, vozes robustas construídas a partir dos métodos citados acima, modelo LTS robusto já compilado ou mesmo financeira.

Os apoiadores terão seus nomes e suas ações mencionadas em novas atualizações. 

Muito obrigada por ler até aqui!

## To-Do

Aqui será uma lista com os recursos que irão ser implementados. Com o passar das atualizações, os itens serão marcados. 

Isso pode sofrer mudanças ao decorrer do tempo.

###### Tokenização
1. [ ] **Conversão de números em palavras:**
	  1. [ ] Fazer código para conversão numérica
	  3. [ ] Testar código.
	  4. [ ] Lançar no repositório
2. [ ] **Conversão de emojis em palavras:**
	1. [ ] Encontrar banco de emoji com suas transcrições em PT-BR.
	2. [ ] Criar um dicionário fonético ser apenas usados para os emojis.
	3. [ ] Fazer que o dicionário seja usado com dicionário fonético principal e o modelo lts.
	4. [ ] Testar com lista de emojis.
	5. [ ] Lançar ao repositório
	6. [ ] Colocar origem do banco de emojis e informações extras e seus autores originais ao repositório do projeto.
3. **Abreviaturas:**
	1. [ ] Procurar as abreviaturas mais usadas no PT-BR. Incluindo as formais e informais como o intenteis.
	2. [ ] Adicionar essas abreviaturas ao um dicionário de exceções. 
	3. [ ] Procurar um método para prever abreviaturas.
	4. [ ] Procurar um método para tratar essas abreviaturas. Transformar na sua forma de pronunciar.
	5. [ ] Fazer um "código próprio" para essa tarefa. 
	6. [ ] Testar com textos com várias abreviaturas mais usadas e também desconhecidas.
	7. [ ] Lançar ao repositório.
	8. [ ] Colocar as informações referente a essa etapa. Ex: Origem da lista de abreviaturas mais usadas, método, etc.


**Aviso:** Infelizmente no momento não é possível fazer essas etapas de tokenizacão. Devido a complicações presentes no projeto. Qualquer contribuição referente a essa parte ou demais do projeto serão bem-vinda ao projeto.

Mais recursos serão colocados ao TO-DO com decorrer do tempo. Quando completo as etapas em desenvolvimento ex. Conversão de números em palavras, conversão de emoji em palavras e etc. serão feitas nas atualizações nas vozes presentes do repositório.

