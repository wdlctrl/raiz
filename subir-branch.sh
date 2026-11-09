#!/usr/bin/env bash
# Sobe a versão atual da LP para a branch revisao-michaela.
# Rode de dentro de ~/Documentos/repo-mi

set -e
cd ~/Documentos/repo-mi

# 1. Identidade do autor — foi isso que travou o commit da vez passada.
#    Troque pelo seu nome e e-mail do GitHub.
git config user.name  "Wendell"
git config user.email "SEU-EMAIL@exemplo.com"

# 2. Garante que você está na branch certa.
git checkout revisao-michaela

# 3. Tira do repositório as imagens velhas que sobraram do clone.
#    Qualquer arquivo na raiz do repo vira URL pública na Vercel,
#    então o que não é usado não deve ficar lá.
git rm --cached --ignore-unmatch \
  img/antes.jpg img/depois.jpg img/iso3d.jpg \
  img/port1.jpg img/port2.jpg img/port3.jpg \
  img/logo.png img/logo-mask.png
rm -f img/antes.jpg img/depois.jpg img/iso3d.jpg \
      img/port1.jpg img/port2.jpg img/port3.jpg \
      img/logo.png img/logo-mask.png

# 4. Confere o que vai entrar antes de commitar.
git add -A
git status --short

# 5. Commit e push.
git commit -m "Logo oficial, favicon e correcao das quebras de linha

- Logo oficial no topo e no rodape, com arte propria para tema claro e escuro
- Favicon em 32 e 180 pixels, nas duas versoes
- Titulo do topo passa a ocupar a largura inteira: a frase nao quebra mais no meio
- Todos os titulos de secao agora cabem em uma linha so
- Linhas de apoio dos projetos e do formulario cabem inteiras
- Remove imagens antigas que sobraram do clone"

git push origin revisao-michaela
