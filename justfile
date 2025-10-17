dev:
    stata-mp "do developer"

[working-directory: 'site']
render:
    #!/usr/bin/env bash
    source .venv/bin/activate
    python -m nbstata.install --sys-prefix
    quarto render
    rm -r ../docs/*
    mv _site/* ../docs/
    
[working-directory: 'cscripts']
test:
    stata-mp -b "do master"
