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
syn keyword apFun           signature filename line that target entity memberptr result
syn keyword apFun           proceed action array
syn match   apFun           "\varg(\<\d+\>)?"
syn match   apFun           "\vidx(\<\d+\>)?"
syn keyword apTjp           tjp
syn keyword apType          base derived
syn keyword apCompileTime   That Target Entity MemberPtr Result ARGS Array DIMS JPID JPTYPE
syn match   apCompileTime   "\vRes\:\:(Type|ReferredType)"
syn match   apCompileTime   "\vArg\<\d+\>::(Type|ReferredType)"
"" TODO Joint point APIs, a bit complicated...
syn keyword apJointPointAPI That BASECLASSES MEMBERS
syn match   apJointPointAPI "\vBaseClass\<\d+\>::(Type|prot|spec)"
syn match   apJointPointAPI "\vMember\<\d+\>::(Type|ReferredType|prot|spec)"
"" TODO highlight the number in e.g. Arg<1>
"" TODO include the parenthesis for function
hi def link apStructure	    Structure
hi def link apPosition      Label
hi def link apPointcut      Structure
hi def link apFun           Macro
hi def link apJointPointAPI Macro
hi def link apTjp           Keyword
hi def link apTypes         Type
" for testing
hi def link apRuntimeFun    Type
