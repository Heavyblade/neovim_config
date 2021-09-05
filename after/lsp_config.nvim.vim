lua << EOF
  require'lspconfig'.solargraph.setup{ on_attach=require'completion'.on_attach }
EOF
