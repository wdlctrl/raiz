# Mi Projeta — landing page

Página estática de campanha para o Google Ads. Arquitetura e interiores,
Vale do Paraíba. Sem build, sem framework, sem dependências.

## Estrutura

    index.html    a página inteira: HTML, CSS e JS num arquivo só
    img/          imagens, já comprimidas para web

## Publicar na Vercel

Projeto novo, framework **Other**, sem comando de build, output na raiz.
O domínio entra em Settings > Domains e o HTTPS sai automático.

Conectando este repositório, cada branch ganha uma URL de preview. Serve
para revisar uma variação sem tirar a produção do ar.

## Rastreamento

No topo do `index.html` existe o bloco `window.MP_CONFIG` com quatro
campos. Enquanto um campo estiver vazio, aquela ferramenta não carrega e
o resto da página continua funcionando.

    ga4       GA4, formato G-XXXXXXXXXX
    adsId     Google Ads, formato AW-XXXXXXXXX
    adsLabel  rótulo da conversão, AW-XXXXXXXXX/AbCdEfGhIj
    clarity   código do projeto no Microsoft Clarity

Eventos disparados: `clique_whatsapp` (com a posição do botão, e é o que
registra a conversão no Ads), `clique_interno`, `rolagem`, `faq_aberto`,
`form_iniciado` e `form_abandonado`. Todos carregam `gclid` e `campanha`,
capturados da URL na primeira visita.

Para conferir: abra a página com `?gclid=teste` no fim da URL e digite
`dataLayer` no console.

## Antes de ligar o anúncio

Política de privacidade e aviso de cookies, exigidos pelo Google Ads e
necessários pela LGPD, já que Clarity e GA4 gravam comportamento.

## Notas internas

Ficam fora deste repositório, de propósito. Qualquer arquivo versionado
aqui pode acabar servido publicamente pela Vercel.
