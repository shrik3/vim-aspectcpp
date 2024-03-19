" Vim syntax file
" Language:	AspectC++
" Maintainer: Tianhao Wang <tianhao.wang2@mailbox.tu-dresden.de>
" BASED ON CPP SYNTAX FILE BY:
" Last Change:	2024 Mar 20
" Reference https://www.aspectc.org/doc/ac-quickref.pdf
" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" inform C syntax that the file was included from cpp.vim
let b:filetype_in_cpp_family = 1

" Read the C++ syntax to start with
runtime! syntax/cpp.vim
unlet b:current_syntax

" AspectC++ extensions
syn keyword apStructure	    aspect slice advice
syn keyword apPosition      around before after order
syn keyword apPointcut      pointcut Attribute
syn keyword apFun           call builtin execution construction destruction get set ref
syn keyword apFun           signature filename
syn keyword apTjp           tjp
syn keyword apType          base derived
syn keyword apCompileTime   That Target Entity MemberPtr Result ARGS Array DIMS JPID JPTYPE
syn match   apCompileTime   "\vRes\:\:(Type|ReferredType)"
syn match   apCompileTime   "\vArg\<\d+\>::(Type|ReferredType)"

hi def link apStructure	    Structure
hi def link apPosition      Label
hi def link apPointcut      Structure
hi def link apFun           Function
hi def link apTjp           Keyword
hi def link apTypes         Type

" for testing
hi def link apRuntimeFun    Type
