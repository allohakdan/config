" VIM YAML Syntax File With highlighting, auto indenting
" Top part from 
" https://github.com/roalddevries/yaml.vim
syntax cluster BlockItem contains=BlockSequenceEntry,BlockMappingExplicitEntry,BlockMappingImplicitEntry

" {{{ Stream
syntax region Stream
    \ start=/\%^/
    \ end=/\%$/
    \ fold keepend
    \ contains=DirectivesDocument,ExplicitDocument,BareDocument
" }}}

" {{{ DirectivesDocument
syntax region DirectivesDocument
    \ start=/^%/
    \ end=/^\.\.\.\|^\(---\)\_.\{-}^\(---\)\@=/
    \ keepend
    \ contains=Directives,ExplicitDocument
    \ contained
" }}}

" {{{ Directives
syntax region Directives
    \ start=/^%/
    \ end=/^\.\.\.\|^\(---\)\@=/
    \ fold keepend
    \ contains=NONE
    \ contained
" }}}

" {{{ ExplicitDocument
syntax region ExplicitDocument
    \ start=/^---/
    \ end=/^\.\.\.\|^\(---\)\@=/
    \ fold keepend
    \ contains=BlockSequenceContent,BlockMappingContent
    \ contained
" }}}

" {{{ BareDocument
syntax region BareDocument
    \ start=/.\?/
    \ end=/^\.\.\.\|^\(---\)\@=/
    \ fold keepend
    \ contains=@BlockItem
    \ contained
" }}}

" {{{ BlockSequenceEntry
syntax region BlockSequenceEntry
    \ start=/^\z( *\)-\_[ ]/
    \ skip=/^\z1 \|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ contains=@BlockItem
    \ contained
" }}}

" {{{ BlockMappingExplicitEntry
syntax region BlockMappingExplicitEntry
    \ start=/^\z( *\)?\_[ ]\@=/
    \ skip=/^\z1[ :]\|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ contains=@BlockItem
    \ contained
" }}}

" {{{ BlockMappingImplicitEntry
syntax region BlockMappingImplicitEntry
    \ start=/^\z( *\)\([^ ?-]\|-[^ \n]\)[^#]*:\_[ ]\@=/
    \ skip=/^\z1[ -]\|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ contains=@BlockItem
    \ contained
" }}}

" Some things Dan added
" hi def link BlockSequenceEntry Statement
hi def link BlockMappingExplicitEntry Constant
hi def link BlockMappingImplicitEntry PreProc
set shiftwidth=2





" Vim indent file
" Language: Yaml
" Author: Ian Young
" Get it bundled for pathogen: https://github.com/avakhov/vim-yaml

if exists("b:did_indent")
  finish
endif
"runtime! indent/ruby.vim
"unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent sw=2 et
setlocal indentexpr=GetYamlIndent()
setlocal indentkeys=o,O,*<Return>,!^F

function! GetYamlIndent()
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  if line =~ ':$'
    return increase
  else
    return indent
  endif
endfunction

" vim: fdm=marker expandtab
