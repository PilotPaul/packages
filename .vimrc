""noremap	no recursive,被映射的序列不会再被递归映射
""map		被映射的序列会被递归映射
""	:map j gg	j 被映射到 gg
""	:map Q j	Q 被映射到 gg
""	:noremap W j	W 只被映射到 j
""	对于这些映射集合中的每一个，存在在正常，视觉，选择和运算符模式(：map和：noremap)中工作的mapping，其在
""	正常模式下工作(：nmap和：nnoremap)，一个在视觉模式：vmap和：vnoremap)等, 有关这方面的更多指导，请参阅：
"":help :map
"":help :noremap
"":help recursive_mapping
"":help :map-modes
""i			insert,插入模式生效
""n			normal,普通模式生效
"**********************************************************************************************************
"==============================common configuration============================== 
"Search Path for files 
set path=.,/usr/include,/mnt/hgfs/share/C_summary/,  

"Control
set nocompatible               	"关闭vi兼容,不使用vi键盘模式
filetype off                   	"关闭文件类型侦测,vundle需要
"filetype on					" 侦测文件类型
"filetype plugin on				" 载入文件类型插件
"filetype indent on				" 为特定文件类型载入相关缩进文件
"filetype plugin on				"允许插件
set enc=utf-8					"Encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
syntax enable
syntax on						"语法高亮
set backspace=2					" 使回格键（backspace）正常处理indent, eol, start等
set whichwrap=<,>,[,]			"当光标到行首或行尾，允许左右方向键换行
set autoread					"文件在vim外修改过，自动重载
set nobackup					"从不备份
set confirm						"在处理未保存或只读文件的时候，弹出确认
set scrolloff=3					"光标移动到buffer的顶部和底部时保持3行距离
set history=1000				"历史记录数
set mouse=                    	"关闭鼠标
"set mouse=a					" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=inclusive       	"选择包含最后一个字符
set selectmode=mouse,key      	"启动选择模式的方式
"set completeopt=preview,menu 	"智能补全,弹出菜单,多项预览,打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu  	"智能补全,弹出菜单，无歧义时才自动填充
set noswapfile					"禁止生成临时文件
set hidden                    	"允许在有未保存的修改时切换缓冲区
set gdefault					"行内替换

"Display
"colorscheme slate	
colorscheme mycolor           "选择配色方案
set t_Co=256                  "可以使用的颜色数目
set number                    "显示行号
set laststatus=2              "最后一个文件始终显示状态行
set foldcolumn=0			  " 设置在状态行显示的信息
set foldmethod=indent		"折叠级别的标识为缩进 
set foldlevel=3				"折叠级别为3 
set cursorline                " 突出显示当前行
set magic                     " 设置魔术
"set guioptions-=T            " 隐藏工具栏
"set guioptions-=m            " 隐藏菜单栏
set foldenable                " 开始折叠
set ruler                     "打开状态栏标尺
set showcmd                   "显示输入的命令
set ignorecase				  "搜索忽略大小写
set hlsearch                  "检索时高亮匹配项
set incsearch                 "边检索边显示匹配
"set go-=T                     "去除gvim的toolbar
set showmatch                 "高亮括号匹配
set matchtime=1               "匹配括号高亮的时间(十分之一秒)
set matchpairs={:},(:),[:],<:>    "高亮匹配括号"{}""()""[]""<>"
"输入 /* 后自动补齐为 /**/ 
imap /*	/**/<ESC><LEFT>i
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>		"quickfix模式
set noeb	"去掉输入错误的提示声音
"set langmenu=zh_CN.UTF-8		"语言设置
set langmenu=en_US.UTF-8		"语言设置
set helplang=en
"状态行显示的内容（包括文件类型和解码）
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2	" 总是显示状态行
set cmdheight=2		" 命令行（在状态行下）的高度，默认为1，这里是2
set viminfo+=!		" 保存全局变量
set iskeyword+=_,$,@,%,#,-	" 带有这些符号的单词不要被换行分割
set linespace=0		" 字符间插入的像素行数目
set wildmenu		" 增强模式中的命令行自动完成操作
set report=0		" 通过使用: commands命令，告诉我们文件的哪一行被改变过
"function! ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction

"Style
set noexpandtab               	"不要将tab转换为空格
"set softtabstop=4				"统一缩进为4
set shiftwidth=4              	"自动缩进的距离,也是平移字符的距离
set tabstop=4                 	"tab键对应的空格数
"set autoindent                	"自动缩进
"set smartindent               "智能缩进
"set cindent					  	"C风格缩进
"set clipboard=unnamed 			"共享剪贴板,当前没有这个寄存器
:set makeprg=gcc\ -Wall\ -g\ -I/mnt/hgfs/share/C_summary/INCLUDE\ \ %	"make 运行当前C文件
set smarttab					"在行和段开始处使用制表符
"for diff
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
"=======================================Key Mapping========================================

let mapleader = '\'		"按键映射的起始字符
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVG<End>Y
map! <C-A> <Esc>ggVG<End>Y
"全局缩进
map <F12> gg=G	
" 选中状态下 Ctrl+c 复制,当前无+号剪切板
"vmap <C-c> "+y
"nnoremap <C-l> gt	"使用Ctrl-l 和 Ctrl+h 切换标签页  
"nnoremap <c-h> gT
"在行末加上分号  
nnoremap <silent> <Leader>; :<Esc><End>a<Space>;<Esc><Down>		
"保存  
"nnoremap <C-s> :w<CR>
"替换  
nnoremap <C-h> :%s/<C-R>=expand("<cword>")<CR>/<C-R>=expand("<cword>")<CR>

"=======================================Plugin Management========================================
"下载/更新vundle
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

"下载pathogen
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

" 将vundle加入到runtime path
set rtp+=/root/.vim/bundle/Vundle.vim

" 下载到bundle目录的插件
call vundle#begin()

" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-powerline.git'
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'tomtom/tlib_vim'
"Plugin 'tomtom/viki_vim'
Plugin 'nerdtree'
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
Plugin 'txt.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'taglist.vim'
Plugin 'EasyGrep'

" Git plugin not hosted on GitHub
" Plugin 'git://...'
Plugin 'xterm-color-table.vim'

" git repos on your local machine
" Plugin 'file://...'

call vundle#end()

filetype plugin indent on    " required 

"===================================Configuration for Plugins======================================
"-----pathogen-----
execute pathogen#infect()

"-----NERDTree-----
"r : refresh dir, because no auto-refresh if files changed in dir
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>o :NERDTreeFind<CR>
let g:NERDTreeCaseSensitiveSort = 1
"let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize = 25
let g:NERDTreeWinPos = "right"  
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHidden=0     "不显示隐藏文件
"let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"autocmd VimEnter * NERDTree	"打开vim自动进入NERDTree

"-----vim-airline-----	//优化vim界面
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='bubblegum'

"-----Command-T-----  
let g:CommandTFileScanner = 'ruby'   "使用ruby作为文件浏览器
let g:CommandTTraverseSCM = 'dir'    "根目录为执行vim时所在的目录
"打开文件跳转 
nnoremap <silent> <Leader>f :CommandT<CR>

"-----taglist-----
"F3快捷键显示程序中的各种tags，包括变量和函数等
map <F3> :TlistToggle<CR>			
let Tlist_WinWidt=25
let Tlist_Show_One_File = 1           "只显示当前文件的taglist  
let Tlist_Exit_OnlyWindow = 1         "taglist是最后一个窗口时退出vim  
let Tlist_Use_Left_Window = 1         "在左侧窗口显示taglist  
let Tlist_GainFocus_On_ToggleOpen = 1 "打开taglist时，光标停在taglist窗口  
let Tlist_Auto_Update = 1             "自动更新
"let Tlist_Use_Right_Window=1
" 打开标签浏览器
"nnoremap <silent><Leader>dt :Tlist<CR>
" 重新生成标签
nnoremap <silent><Leader>bt :!sh ~/.vim/syntax/hitags.sh<CR>
" 标签分类
nnoremap <silent><Leader>ht :so tags.vim<CR>
" 选择ctags创建的标签
set tags=./tags;,tags,~/.vim/systags

""-----Powerline-----, obolated by airline
"set fillchars+=stl:\ ,stlnc:\
set fillchars=vert:\ ,stl:\ ,stlnc:\		"在被分割的窗口间显示空白，便于阅读
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'filename'  "只显示文件名

"-----cscope----- 
"加载cscope库  
"if filereadable("/usr/local/src/cscope/cscope.out")  
"if filereadable("cscope.out")  
"    cs add cscope.out  
"endif
"使用quickfix窗口显示结果,告诉VIM可以使用quickfix窗口显示cscope的查找列表
set cscopequickfix=s-,c-,d-,i-,t-,e- 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope 自动加载cscope.out文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")  
	set csprg=/usr/bin/cscope  
	set csto=0 "设置为0，那么cscope数据将会被优先查找，假如cscope没有返回匹配项，然后才会查找tag文件
	set cst  "跳转时也使用cscope库
	set csverb  
	set cspc=3 "决定了一个文件的路径的多少部分被显示,默认值是0，显示整个路径;值为1的话，那么就只会显示文件名，不带路径;
				"设置为3,显示文件路径的最后3个部分，包含这个文件名本身
	"add any database in current dir  
	if filereadable("cscope.out")  
		cs add cscope.out  
		"else search cscope.out elsewhere  
	else 
		let cscope_file=findfile("cscope.out",".;")  
		let cscope_pre=matchstr(cscope_file,".*/")  
		if !empty(cscope_file) && filereadable(cscope_file)  
			set nocsverb
			exe "cs add" cscope_file cscope_pre
			set csverb
		endif        
	endif  
endif
"重新生成索引文件
nnoremap <silent><Leader>bc :!cscope -Rbq<CR>
"s: 查找本C符号
"g: 查找本定义
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找本字符串
"e: 查找本egrep模式
"f: 查找本文件
"i: 查找包含本文件的文件
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>  

"-----YouCompleteMe-----
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 	"离开插入模式后自动关闭预览窗口"
let g:ycm_server_python_interpreter= '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '/root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'	"C family Completion Path
let g:ycm_key_invoke_completion = '<C-Tab>'         		"跨文件补全
let g:ycm_confirm_extra_conf = 0							"关闭加载配置文件提示
let g:ycm_cache_omnifunc = 0                        		"关闭补全缓存 
let g:ycm_enable_diagnostic_signs = 0               		"关闭诊断提示符
let g:ycm_enable_diagnostic_highlighting = 1       			"关闭诊断高亮
"let g:ycm_show_diagnostics_ui = 0                   		"关闭诊断ui,禁用语法检查
let g:ycm_min_num_of_chars_for_completion = 2      			"从第2个键入字符开始罗列匹配项
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_python_binary_path = '/usr/bin/python3'			"Python Semantic Completion
"获取变量类型  
nnoremap <silent><Leader>yt :YcmCompleter GetType<CR>
"跳转定义或声明
nnoremap <silent><Leader>yg :YcmCompleter GoTo<CR>
" 跳转到定义处
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"跳转包含文件  
nnoremap <silent><Leader>yi :YcmCompleter GoToInclude<CR>
"打开诊断信息
nnoremap <silent><Leader>yd :YcmDiags<CR>
"" 回车即选中当前项
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"-----EasyGrep-----  
let EasyGrepMode = 2        "根据文件类型搜索相应文件
let EasyGrepRecursive = 1   "递归搜索
let EasyGrepCommand = 1     "使用grep
let EasyGrepJumpToMatch = 0 "不要跳转

"-----------indentline.vim--------------
let g:indentLine_color_term = 239 "文字终端改变垂直线颜色
let g:indentLine_color_gui = '#A4E57E' "图形终端改变垂直线颜色

"-----text.vim----- 
au BufRead,BufNewFile *  setfiletype txt	" 高亮显示普通txt文件（需要txt.vim脚本）

" 非 github 仓库的插件"
" Plugin 'git://git.wincent.com/command-t.git'
" 本地仓库的插件 "

"-----delimitMate.vim----- 
"let g:loaded_delimitMate = 1	"禁用自动括号匹配

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""title of new files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.vim exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%:t")) 
		call append(line(".")+1, "# Author: PilotPaul") 
		call append(line(".")+2, "# mail: ass163@qq.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/bash")
		call append(line(".")+6, "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/src/gcc/gcc-6.4.0")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")
	elseif &filetype == 'vim' 
		call setline(1, "\"*************************************************************************") 
		call append(line("."), "\"	> File Name: ".expand("%:t")) 
		call append(line(".")+1, "\"	> Author: PilotPaul") 
		call append(line(".")+2, "\"	> Mail: ass163@qq.com ") 
		call append(line(".")+3, "\"	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\"************************************************************************") 
	else
		call setline(1, "/*************************************************************************/") 
		call append(line("."), "/*	> File Name: ".expand("%:t")." */")
		call append(line(".")+1, "/*	> Author: PilotPaul */")
		call append(line(".")+2, "/*	> Mail: ass163@qq.com */")
		call append(line(".")+3, "/*	> Created Time: ".strftime("%c")." */")
		call append(line(".")+4, "/************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <string.h>")
		call append(line(".")+8, "")
		call append(line(".")+9, "#ifdef __cplusplus")
		call append(line(".")+10, "extern \"C\"{")
		call append(line(".")+11, "#endif")
		call append(line(".")+12, "")
		call append(line(".")+13, "#ifdef __cplusplus")
		call append(line(".")+14, "}")
		call append(line(".")+15, "#endif")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
endfunc
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal 14G
