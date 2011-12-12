# Cassandra CQL Syntax Highlighter for Vim
Highlight CQL syntaxes inside the vim editor.

## Installation
Copy the _cql.vim_ file into your ~/.vim/syntax directory.

## Vim Usage
Inside vim:
    :set syn=cql

# Automatic loading
In your _~/.vimrc_ file, add the following line:
    autocmd BufRead *.cql set syntax=cql
