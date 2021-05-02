##########################################################################
# File Name: refresh.sh
# Author: PilotPaul
# mail: ass163@qq.com
# Created Time: Sun 02 May 2021 11:24:44 AM CST
#########################################################################
#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/src/gcc/gcc-6.4.0
export PATH

cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py .
cp /root/.vimrc .
cp /root/.vim/autoload/pathogen.vim .
cp /root/.vim/colors/mycolor.vim .
cp /root/.vim/syntax/* .
git add .
git commit -m "update"
git push
