# Cassandra CQL Syntax Highlighter for Vim
Highlight CQL syntaxes inside the vim editor.

## Install with pathogen

    cd ~/.vim/
    git submodule add git@github.com/elubow/cql-vim.git bundle/cql-vim
    vim bundle/
    
## Manual install 

    cd ~/.local/src
    git clone git@github.com/elubow/cql-vim.git 
    cp -R cql-vim/syntax/* ~/.vim/syntax/
    cp -R cql-vim/ftdetect/* ~/.vim/ftdetect/
