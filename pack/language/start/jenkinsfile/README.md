# Jenkinsfile-vim-syntax
A plugin that enables Jenkins DSL job syntax coloring + indentation.

## Under the hood
Simply recognises your project's `Jenkinsfile` as a [Groovy](http://groovy-lang.org/) script. See [this Jenkins documentation](https://jenkins.io/doc/book/pipeline/jenkinsfile/) for details.

## Installation
Installing the plugin's easy. First, make sure you've got [pathogen](https://github.com/tpope/vim-pathogen) installed. Then, just clone this repo:

```bash
git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git ~/.vim/bundle/Jenkinsfile-vim-syntax
```

Then fire up Vim and you're good to go.

Alternatively, this is included in the [vim-polyglot package](https://github.com/sheerun/vim-polyglot), though polyglot may lag behind this repo by a version or two.
