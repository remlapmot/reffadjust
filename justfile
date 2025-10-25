dev:
    stata-mp "do developer"

[working-directory: 'site']
render:
    #!/usr/bin/env bash
    uv sync
    source .venv/bin/activate
    python -m nbstata.install
    quarto render
    rm -rf ../docs
    mkdir ../docs
    mv _site/* ../docs/
    
[working-directory: 'cscripts']
test:
    stata-mp -b "do master"
