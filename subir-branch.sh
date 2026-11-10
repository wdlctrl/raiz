#!/usr/bin/env bash
# Sobe a versão atual da LP para a branch revisao-michaela.
#
# ANTES DE RODAR: troque o e-mail na linha do git config abaixo.
# O script para sozinho se você esquecer.
#
# Uso:  cd ~/Documentos/repo-mi && bash subir-branch.sh

set -euo pipefail
cd ~/Documentos/repo-mi

EMAIL="wdlctrl@gmail.com"
NOME="Wendell"

if [ "$EMAIL" = "SEU-EMAIL@exemplo.com" ]; then
  echo "Pare: edite a variável EMAIL no topo deste arquivo com o seu e-mail do GitHub."
  exit 1
fi

# 1. Identidade do autor. Foi isso que travou o commit da vez passada.
git config user.name  "$NOME"
git config user.email "$EMAIL"

echo "Branch atual: $(git rev-parse --abbrev-ref HEAD)"
git checkout revisao-michaela

# 2. Tira do repositório as imagens velhas que sobraram do clone original.
#    Nenhuma é usada pela LP de hoje, e tudo que fica versionado vira
#    URL pública na Vercel.
VELHAS="img/antes.jpg img/depois.jpg img/iso3d.jpg
        img/port1.jpg img/port2.jpg img/port3.jpg
        img/logo.png img/logo-mask.png"
git rm --cached --ignore-unmatch $VELHAS >/dev/null 2>&1 || true
rm -f $VELHAS

# 3. Mostra o que vai entrar. Confira antes de seguir.
git add -A
echo
echo "--- arquivos que vão no commit ---"
git status --short
echo "----------------------------------"
read -r -p "Seguir com o commit e o push? [s/N] " RESP
[ "$RESP" = "s" ] || { echo "Cancelado. Nada foi commitado."; exit 0; }

git commit -m "Logo oficial, favicon e correcoes de alinhamento da revisao

- Logo oficial no topo e no rodape, com arte propria para tema claro e escuro
- Favicon em 32 e 180 pixels, nas duas versoes
- Titulo do topo ocupa a largura inteira: a frase nao quebra mais no meio
- Todos os titulos de secao cabem em uma linha so
- FAQ, Como funciona, Pacotes e as frases de destaque vao ate a borda direita
- Lista de entregaveis sem fundo branco, seta na linha do subtitulo
- Sublinhado em 'de gente de verdade' no lugar da barra verde
- Rodape sem a linha 'Arquitetura & interiores'
- Bloco FAQPage em JSON-LD, gerado a partir do texto visivel
- Remove imagens antigas que sobraram do clone"

git push origin revisao-michaela
echo
echo "Pronto. A Vercel deve iniciar o deploy da branch em alguns segundos."
