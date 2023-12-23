FestPB é um projeto com objetivo de oferecer suporte ao Português Brasileiro ao software Text-to-Speech Festival Speech Synthesis. Com opções de baixar pacotes de vozes.

**Rescursos disponíveis no momento:**
- Script para construção de dicionário do idioma Português Brasileiro.
- Scripts para construção de modelos LTS (Lettng to Sound - Letras para Som) para Festival Speech Synthesis.
- PhoneSet com fonemas do Português Brasileiro.
- Script para geração de pitchmarck usado [REAPER](https://github.com/google/REAPER) 
- Script para construção desse seguintes programas (Festvox, Festival, Speech Tools e REAPER) e instalação de um G2P. 
- G2P usado [Annotator](https://github.com/falabrasil/annotator)
- Arquivos para o suporte de fonemas do português brasileiro ao Festival Speech Synthesis. 


##  Sobre dicionário e fonemas usados.

Dicionário fonético e fonemas são fornecidos pelo grupo Falabrasil com seu software G2P chamado annotator. As fonemas estão em codificação UTF-8.

Para construção do Phoneset foi usado como base o seguinte artigo: "Síntese de Fala em Português Brasileiro Baseada em
Modelos Ocultos de Markov" feito por Carlos Francisco Soares de Souza. 

Houve algumas pesquisas mas as suas fontes estão perdidas. As características fonéticas das fonemas marcadas no Phoneset podem está incorretas em algumas partes. 

Caso houve erros, por favor faça uma contribuição 
## Recados Importantes

**No seguite momento não á:**
- Tutorial ou mesmo documentação para construir/instalar uma voz em português brasileiro. Sendo necessário conhecimento e familiaridade com Festival Speech Synthesis.
- Conversão de números, emojis e símbolos.
- Sem modelo POS Tagging em português brasileiro para Festival Speech Synthesis.
- Scripts para construção automática de vozes. 
- Sem vozes de outros bancos de dados conhecidos. 
- Sem *stress* ao dicionário fonético. 

As vozes disponíveis aqui para fazer o dowloand foram construídas usado o método concatenativo "Unit Selection". Podem oferecer qualidades mas em alguns casos podem haver falhas na geração de fala. No momento o meu ambiente de desenvolvimento não tem capacidade computacional para tarefas mais grandes como a construção de vozes com o método "Statistical Parametric Speech Synthesis " baseada em modelos HMM e construção de modelo LTS robusto.

Ficarei feliz em receber qualquer apoio disponível para esse projeto. Como correção de problemas, vozes robusta construídas a partir dos métodos citados acima, modelo LTS robusto já compilado ou mesmo financeira.

Os apoiadores teram seus nomes e suas ações mencionadas em novas atualizações. 

Muito obrigada por ler até aqui!

