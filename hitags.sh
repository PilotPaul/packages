#!/bin/bash  
#ctags -R --fields=+la --extra=+q;  
#ctags -R --languages=c,c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+x --fields=+aliSz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc

### generate system tags, with exclude 'testsuite'
ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c++-kinds=+x --fields=+ailSz --extra=+q --langmap=c++:+.inl -h +.inl --exclude=lex.yy.cc --exclude=copy_lex.yy.cc --excmd=number -R
### generate local source tags
#ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c++-kinds=+x --fields=+ailSz --extra=+q --langmap=c++:+.inl -h +.inl --exclude=lex.yy.cc --exclude=copy_lex.yy.cc --excmd=number -R
#ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++,php,html,javascript --links=yes --c-kinds=+px --c++-kinds=+px --fields=+afliS --extra=+q --langmap=c:+.inl -h +.inl --exclude=lex.yy.cc --exclude=copy_lex.yy.cc --excmd=number -R 

## work with '--field=la'
#awk -F '"' '$2 ~ /^\tf/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cFunction " $1}' 1>  tags.vim ; 
#awk -F '"' '$2 ~ /^\t[de]/ {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cMacro " $1}'    1>> tags.vim ; 
#awk -F '"' '$2 ~ /^\tt/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cTypedef " $1}'  1>> tags.vim ; 
#awk -F '"' '$2 ~ /^\tv/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cGlobal " $1}'   1>> tags.vim ; 
#awk -F '"' '$2 ~ /^\te/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cEnum " $1}'  	  1>> tags.vim ; 

## work with '--fields=+aliSz'
awk -F '"' '$2 ~ /kind:f/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cFunction " $1}' 1>  tags.vim ; 
awk -F '"' '$2 ~ /kind:[de]/ {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cMacro " $1}'    1>> tags.vim ; 
awk -F '"' '$2 ~ /kind:t/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cTypedef " $1}'  1>> tags.vim ; 
awk -F '"' '$2 ~ /kind:v/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cGlobal " $1}'   1>> tags.vim ; 
awk -F '"' '$2 ~ /kind:e/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cEnum " $1}'  	  1>> tags.vim ; 
