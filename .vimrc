let mapleader=" "
syntax on

set number
set norelativenumber
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=38 columns=150    " 设定窗口大小  
set go=             " 不要图形按钮  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
"syntax on           " 语法高亮  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
"set novisualbell    " 不要闪烁(不明白)  
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
" set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif


filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


noremap ; :
noremap J 5j
noremap K 5k
noremap L 5l
noremap H 5h

map <LEADER>l :set splitright<CR>:vsplit<CR>
map <LEADER>h :set nosplitright<CR>:vsplit<CR>
map <LEADER>j :set nosplitbelow<CR>:split<CR>
map <LEADER>k :set splitbelow<CR>:split<CR>

map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-j> <C-w>j

map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><right> :vertical resize-5<CR>
map <LEADER><left> :vertical resize+5<CR>

au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"Press space twice to junp to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><cr>:nohlsearch<cr>c4l


"去除VI一致性,必须(<++>)

set nocompatible
"必须
filetype off

"设置Vundle的运行路径
set rtp+=~/.vim/bundle/Vundle.vim
"设置插件的安装路径,vundle插件起始标志
call vundle#begin('~/.vim/bundle')

"让vundle管理插件版本
Plugin 'VundleVim/Vundle.vim'

"添加vim主题
Plugin 'connorholyday/vim-snazzy'

"添加nerdtree插件
Plugin 'scrooloose/nerdtree'
"使用tab键切换窗口与目录树
Plugin 'jistr/vim-nerdtree-tabs'
"添加jedi-vim代码补全插件
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'

"python语法检测
Plugin 'scrooloose/syntastic'

"添加PEP8代码风格检查
Plugin 'nvie/vim-flake8'
"配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"代码折叠插件
Plugin 'tmhedberg/SimpylFold'
"自动缩进
Plugin 'vim-scripts/indentpython.vim'
"在vim的normal模式下搜索文件
Plugin 'kien/ctrlp.vim'
"Powerline状态栏
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'

" Markdown
"Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plugin 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plugin 'vimwiki/vimwiki'

"你的所有插件需要在下面这行之前
call vundle#end()

colorscheme snazzy
let g:SnazzyTransparent = 1
"设置分割窗口
set splitbelow
set splitright
" NERDTree插件的配置信息
""将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreewinSize=31
""窗口是否显示行号
"let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeShowHidden=0
"隐藏目录树种的.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
"let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"goto,YCM提供的跳跃功能采用了vim的jumplist，往前跳和往后跳的快捷键为Ctrl+O以及Ctrl+I。
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>



"设置主题颜色，以及设置快捷键F5
" if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
"call togglebg#map("<F6>")

"syntastic
"设置error和warning的标志
"let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol='e'
"let g:syntastic_warning_symbol='w'
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
"let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 0
"修改Locaton List窗口高度
"let g:syntastic_loc_list_height = 3
""打开文件时自动进行检查
"let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
"let g:syntastic_auto_jump = 1
"设置pyflakes为默认的python语法检查工具
"let g:syntastic_python_checkers = ['pyflakes']

"开启代码折叠
set foldmethod=indent
set foldlevel=99
"设置快捷键为空格
"nnoremap <space> za
"显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

"python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4
au BufNewFile,BufRead *.py,*.pyw set textwidth=79
au BufNewFile,BufRead *.py,*.pyw set expandtab
au BufNewFile,BufRead *.py,*.pyw set autoindent
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix

"对其他文件类型设置au命令
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2
"高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/

let python_highlight_all=1

"加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on

filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 5

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_use_clangd = 0

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Supre")
		call append(line(".")+2, "\# mail: Suprammort@163.com")
		call append(line(".")+3, "\# Created Time:".strftime("%c"))
		call append(line(".")+4,"\#########################################################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "    > File Name: ".expand("%"))
		call append(line(".")+1, "    > Author: Supre")
		call append(line(".")+2, "    > Mail: Suprammort@163.com ")
		call append(line(".")+3, "    > Created Time: ".strftime("%c"))
		call append(line(".")+4," ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")

		call append(line(".")+7, "")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
		call append(line(".")+10, "int main(void){")
		call append(line(".")+11, "")
		call append(line(".")+12, "    return 0;")
		call append(line(".")+13, "}")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
		call append(line(".")+8, "int main(void){")
		call append(line(".")+9, "")
		call append(line(".")+10,"  return 0;")
		call append(line(".")+11, "}")
	endif
	autocmd BufNewFile *normal G
endfunc
inoremap ( ()<Esc>i

