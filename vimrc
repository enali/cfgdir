"==== base
set nocompatible
" 高亮搜索, 允许增量式搜索
set incsearch hlsearch
" 搜索时全小写则忽略大小写,有大写字母则大小写敏感
set ignorecase smartcase
" 命令行补全
set wildmenu
" 自动插入缩进
set smartindent
" 文件发生更改时自动读入
set autoread
" 允许未保存缓冲区时编辑新文件
set hidden
" 禁止备份文件
set nobackup
" 指定命令行高度
set cmdheight=2
" 指定显示光标的行列号
set ruler
" 指定行号和相对行号
set nu rnu
" 指定显示未完成命令
set showcmd
" 指定状态栏显示方式
set laststatus=2
" 指定长行一次右滚10字符
set sidescroll=10
" 适当折行
set linebreak
" 虚拟编辑, 允许光标定位到没实际字符的位置
"set virtualedit=all
" 显示折叠栏
"set foldcolumn=2
" 允许Ctrl-A和Ctrl-X加减字母
set nrformats+=alpha
" 让第80列高亮
set colorcolumn=80
" 允许在命令行查询Man手册
runtime ftplugin/man.vim

let mapleader=";"
let maplocalleader=","
" set wig+=
"==== base map
nnoremap <leader>z :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>lw <C-W>l
nnoremap <leader>hw <C-W>h
nnoremap <leader>kw <C-W>k
nnoremap <leader>jw <C-W>j
nnoremap <leader>sw <C-W>s
nnoremap <leader>vw <C-W>v
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>ev :vsp $MYVIMRC<cr>
inoremap <leader>u <esc>gUiwea

"==== colorscheme
colorscheme seoul256
set background=dark
set cursorline cursorcolumn

"==== tab
syntax enable 
syntax on
" 将<tab>键扩展为空格
set expandtab
" 指定'>'缩进量
set shiftwidth=2
" 指定tab键宽度
set softtabstop=2
" 是否开启代码折叠
set nofen "fen
" 指定代码折叠的方式
"set foldmethod=syntax

"==== vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

Plugin 'DrawIt'

Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/tabpagebuffer.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'rust-lang/rust.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'plasticboy/vim-markdown'
Plugin 'asciidoc/vim-asciidoc'
"Plugin 'terryma/vim-expand-region'
Plugin 'wannesm/wmgraphviz.vim'
"Plugin 'klen/python-mode'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'kshenoy/vim-signature'


"""" vim-polyglot has include below
"Plugin 'tpope/vim-git'
"Plugin 'LaTex-Box-Team/LaTex-Box'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'fatih/vim-go'

filetype plugin indent on

"==== tagbar
" x: zoom window, q: quit
" <c-n>, <c-p>: next/prev top-level tag
" <space>: display prototype of a tag
nnoremap <silent> <space>t :TagbarToggle<cr>
let tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_width=30

"==== nerdtree
" m: open menu, I: display hide file, ?: help
nnoremap <silent> <space>f :NERDTreeToggle<cr>
let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

"==== undotree
" >, <: next/prev change
nnoremap <silent> <space>m :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1

"==== polyglot: vim-ruby
" ruby-motion: ]m, ]M, [m, [M, ]], ][, [[, []
" ruby-text-object: am/im, aM/iM
let g:ruby_indent_access_modifier_style='indent'

"==== YouCompleteMe
" Ctrl-space trigger the completion suggestions anywhere
" get a detailed diagnostic message: '<leader>d'
let g:ycm_always_populate_location_list=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoTo<cr>

"==== syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" pip install cpplint
let g:syntastic_cpp_cpplint_exec = 'cpplint'

"==== eclim
let g:EclimCompletionMethod='omnifunc'

"==== ultisnips
nnoremap <leader>ue :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/enali/UltiSnips"

"==== vim-surround
" 'ds': delete surround
" 'cs': change surround
" 'ys': you surround, 'yss': operate on current line
" 'vS': visual mode, surround

"==== unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <space>s :Unite -start-insert file_rec/async:!<cr>
nnoremap <silent> <space>l :Unite -start-insert buffer<cr>
nnoremap <silent> <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <space>y :Unite history/yank<cr>

"====   markdown
" next header         : ]],
" prev header         : [[,
" next sibling header : ][,
" prev sibling header : [],
" current header      : ]c,
" parent header       : ]u
" command: HeaderIncrese/HeaderDecrese
" Toc/Toch/Tocv/Toct  (header overview)
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

"==== tabular
nnoremap <silent> <leader>a> :Tabularize /#=><cr>

"==== vim-expand-region
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

"==== vimproc
" ':VimProcInstall' first
nnoremap <leader>vb :VimProcBang 
nnoremap <leader>vr :VimProcRead 

"==== vimshell
let g:vimshell_popup_command="70vsplit"
let g:vimshell_interactive_interpreter_commands={"coffee":"coffee", 
      \ "python":"ipython3",
      \ "scheme":"scheme"} 
nnoremap <silent> <leader>vs :VimShellPop<cr>
nnoremap <silent> <leader>vi :VimShellInteractive<cr>

"==== wmgraphviz
" <localleader>ll :GraphvizCompile
" <localleader>lv :GraphvizShow
" <localleader>li :GraphvizInteractive
" <localleader>lt :GraphvizCompileLaTeX

"==== emmet-vim
" expand abbreviation or wrap with abbreviation: '<C-y>,'
" select tag: '<C-y>d', '<C-y>D'
" next edit point: '<C-y>n'
" prev edit point: '<C-y>N'
" remove tag: '<C-y>k'
" split/join tag: '<C-y>j'
" toggle comment: '<C-y>/'
" make anchor from url: '<C-y>a'
" make quoted text from url: '<C-y>A'

"==== polyglot
" python-mode is more better
let g:polyglot_disabled = ['python','markdown','rust']

"==== ack.vim
let g:ackprg = 'ag'

"==== ctrlp.vim
"c-p,直接输入字串,模糊搜索或c-r进行正则搜索,c-j/k进行选择,回车编辑或c-t/v在新tab页和垂直分割窗口编辑
"c-f/b模式选择,文件/缓冲区/最近使用文件
"c-d表示只对文件名进行匹配,不匹配整个路径名
"c-n/p选择输入字串的历史回放
"c-z标记/取消标记,c-o打开,用于一次打开多个标记文件
"字串附加':'表示结束,跟cmd表示在指定文件上执行命令,跟数字表示跳转到指定行数,跟diffthis比较标记的多个文件
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

"==== ros's config
autocmd BufNewFile,BufReadPre *.launch,*.xacro,*.urdf,*.sdf set filetype=xml

"==== python-mode
"'<leader>r'运行python代码
"'<leader>b'添加/移除断点

"==== delimitMate
" 所有的设置都有全局和局部版本,局部可针对特定文件类型
" 针对特定文件类型不会载入delimitMate脚本
" au FileType mail let b:loaded_delimitMate = 1
" 针对特定文件类型不会自动关闭分隔符
" au FileType mail let b:delimitMate_autoclose = 0
" 指定匹配的分隔符
" let delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
