" Vim filetype plugin file
" Language:	matlab
" Creator:	Fabrice Guy <fabrice.guy at gmail dot com>
" Maintainer: 	Jesse Codling <jclds139 at gmail dot com>
" Last Changed: 2020 Mar 26 - Automatic setting of compiler and textwidth for
" 	code checking and width compatibility with MATLAB

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo-=C

setlocal fo+=croql
setlocal comments=:%>,:%

if exists("loaded_matchit")
  let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
  let b:match_words = '\<classdef\>\|\<methods\>\|\<events\>\|\<properties\>\|\<if\>\|\<while\>\|\<for\>\|\<switch\>\|\<try\>\|\<function\>:' . s:conditionalEnd
endif

setlocal suffixesadd=.m
setlocal suffixes+=.asv
" Change the :browse e filter to primarily show M-files
if has("gui_win32") && !exists("b:browsefilter")
  let  b:browsefilter="M-files (*.m)\t*.m\n" .
	\ "All files (*.*)\t*.*\n"
endif

let b:undo_ftplugin = "setlocal suffixesadd< suffixes< "
      \ . "| unlet! b:browsefilter"
      \ . "| unlet! b:match_words"

let &cpo = s:save_cpo

setlocal textwidth=80
compiler mlint
