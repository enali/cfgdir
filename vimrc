"""" 通用设定 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"" 高亮搜索, 允许增量式搜索
set incsearch hlsearch
"" 搜索时全小写则忽略大小写,有大写字母则大小写敏感
set ignorecase smartcase
"" 命令行补全
set wildmenu
"" 自动插入缩进
set smartindent
"" 文件发生更改时自动读入
set autoread
"" 允许未保存缓冲区时编辑新文件
set hidden
"" 禁止备份文件
set nobackup
"" 指定命令行高度
set cmdheight=2
"" 指定显示光标的行列号
set ruler
"" 指定行号和相对行号
set nu rnu
"" 指定显示未完成命令
set showcmd
"" 指定状态栏显示方式
set laststatus=2
"" 指定长行一次右滚10字符, 考虑到默认`wrap`, 此无必要
" set sidescroll=10
"" 适当折行
set linebreak
"" 虚拟编辑, 允许光标定位到没实际字符的位置
"set virtualedit=all
"" 显示折叠栏
set foldcolumn=2
"" 允许Ctrl-A和Ctrl-X加减字母
set nrformats+=alpha
"" 让第80列高亮
set colorcolumn=80
"" 设置backspace功能
set backspace=indent,eol,start
"" 记录更多的Ex历史命令
set history=200
"" 设置行宽度, 主要考虑在多数设备80列是最佳宽度
" set textwidth=80
"" 设置前导字符, 默认\
let mapleader=","
"" 将默认的前导符映射到反向重复查找','
nnoremap \ ,


"""" 增强插件激活 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 允许在命令行查询Man手册
runtime ftplugin/man.vim
"" 扩展%的功能, 不只分隔符, 还匹配关键字
runtime macros/matchit.vim


"""" 命令行映射 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 映射可过滤的回溯命令
cnoremap <c-p> <up>
cnoremap <c-n> <down>
"" 用%%在命令行扩展当前文件目录
cnoremap <expr> %% getcmdtype()==':' ? expand('%:h').'/':'%%'


"""" 普通模式映射 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 编辑.vimrc的映射
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
"" 重新载入.vimrc的映射
nnoremap <silent> <leader>ev :vsp $MYVIMRC<cr>


"""" 自动命令 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPre *.java nnoremap <leader>rs :up <bar> !javac % && java %:r<cr>
autocmd BufNewFile,BufReadPre *.java nnoremap <leader>cs :up <bar> !javac %<cr>
autocmd BufNewFile,BufReadPre *.scala nnoremap <leader>rs :up <bar> !scala %<cr>
autocmd BufNewFile,BufReadPre *.scala nnoremap <leader>cs :up <bar> !scalac %<cr>
autocmd BufNewFile,BufReadPre *.rb nnoremap <leader>rs :up <bar> !ruby %<cr>
autocmd BufNewFile,BufReadPre *.py nnoremap <leader>rs :up <bar> !python3 %<cr>
autocmd BufNewFile,BufReadPre *.js nnoremap <leader>rs :up <bar> !node %<cr>


"""" 自定义命令 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 非特权下保存特权文件
command! Ws :w ! sudo tee % >/dev/null


"""" colorscheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme seoul256
set background=dark
set cursorline cursorcolumn


"""" 设置垂直制表符 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable 
syntax on
" 将<tab>键扩展为空格
set expandtab
" 指定'>'缩进量
set shiftwidth=2
" 指定tab键宽度
set softtabstop=2
" 是否开启代码折叠
set nofoldenable
" set foldenable
" 指定代码折叠的方式
set foldmethod=syntax


"""" vundle """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 想使用此插件管理, 先克隆此插件到本地
" :PluginInstall, 安装插件
" :PluginClean, 清理插件
" :PluginUpdate, 更新插件
" :PluginList, 列出当前已安装插件
" :PluginSearch, 搜索插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

""用ascii码画画
Plugin 'DrawIt'

"" 提取代码的tab, 往往是类, 方法等
Plugin 'majutsushi/tagbar'
"" 以特定字符对齐多行, 如:, =, ,, 
Plugin 'godlygeek/tabular'
"" 以边栏的形式提供文件树
Plugin 'scrooloose/nerdtree'
"" 给文件添加git状态标记
Plugin 'Xuyuanp/nerdtree-git-plugin'
"" 提供静态语法检查, 会影响速度
"Plugin 'scrooloose/syntastic'
"" 提供代码注释和去注释
" Plugin 'scrooloose/nerdcommenter'
"" 显示缩进对齐, 视觉辅助
Plugin 'Yggdroot/indentLine'
"" 提供多主题
Plugin 'flazz/vim-colorschemes'
"" 提供多语言的增强插件, 有些只是语法高亮
Plugin 'sheerun/vim-polyglot'
"" 提供状态栏增强显示
Plugin 'bling/vim-airline'
"" 提供可视化撤销树
Plugin 'mbbill/undotree'
"" 提供rails的增强
Plugin 'tpope/vim-rails'
"" 提供haml, 另一种html模板
Plugin 'tpope/vim-haml'
"" 方便文本分隔符的操作, 如添加, 删除, 修改等
Plugin 'tpope/vim-surround'
"" 增强'.'的重复能力, 默认只能重复修改
Plugin 'tpope/vim-repeat'
"" 使用c-a/x正确增加减少时间
Plugin 'tpope/vim-speeddating'
"" 提供智能结束符, 如}, end, fi等
Plugin 'tpope/vim-endwise'
"" 提供gc注释操作符
Plugin 'tpope/vim-commentary'
"" 提供各种列表遍历映射, 如]b即下一个缓冲区
Plugin 'tpope/vim-unimpaired'
"" 提供文件查找,缓冲区查找,历史查找等各种便捷功能, 类似ctrlp
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/neomru.vim'
" Plugin 'Shougo/tabpagebuffer.vim'
"" 全功能补全插件, 特别是对c/cpp提供语义补全
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
"" rust语言的增强插件
Plugin 'rust-lang/rust.vim'
"" 代码片断引擎
Plugin 'SirVer/ultisnips'
"" 用于ultisnips的多语言代码片断
Plugin 'honza/vim-snippets'
"" md文件的增强插件
Plugin 'plasticboy/vim-markdown'
"" asciidoc格式文本的增强插件
Plugin 'asciidoc/vim-asciidoc'
"" .dot文件的增强插件
Plugin 'wannesm/wmgraphviz.vim'
"" python的集成开发插件, 但与多个别的插件没法协作, 所以注释掉
"Plugin 'klen/python-mode'
"" 提供在同一行同字符间的高亮快速移动
"Plugin 'Lokaltog/vim-easymotion'
"" 快速html/css输入引擎, 一个缩写引擎
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
"" 快速grep文本内容的插件, 要安装ack
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'kshenoy/vim-signature'
"" vim中文文档
Plugin 'asins/vimcdoc'
"" 定义各种文本对象
Plugin 'kana/vim-textobj-user'
""函数对象
" Plugin 'kana/vim-textobj-function'
""全局文本对象ae/ie
Plugin 'kana/vim-textobj-entire'
" Plugin 'bps/vim-textobj-python'
" Plugin 'sgur/vim-textobj-parameter'
" Plugin 'kana/vim-textobj-line'


filetype plugin indent on


"""""""""""""""""""""""""""插件配置"""""""""""""""""""""""""""""""""""""""""""


"""" tagbar """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" x: 将窗口放大
" q: 退出窗口
" <c-n>, <c-p>: 下/上一个顶级tag
" <space>: 显示tag的原型声明
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <space>t :TagbarToggle<cr>
"" 窗口开在左侧
let tagbar_left=1
"" 打开tag窗口时自动将光标定位到此窗口
let g:tagbar_autofocus=1
"" 以简洁格式显示tag窗口
let g:tagbar_compact=1
"" 窗口宽度30列
let g:tagbar_width=30


"""" nerdtree """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 目录树插件
" m: 打开文件操作菜单
" I: 显示隐藏文件
" ?: 显示帮助
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <space>f :NERDTreeToggle<cr>
"" 窗口打开在右侧
let NERDTreeWinPos="right"
"" 设置打开tree中的文件时自动关闭tree窗口
let NERDTreeQuitOnOpen=1
"" 简洁格式, 即不在tree窗口显示帮助
let NERDTreeMinimalUI=1
"" 使用m菜单删除文件时自动移除相关缓冲区
let NERDTreeAutoDeleteBuffer=1
"" 设置git状态标记
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


"""" undotree """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本改动窗口
" >, <: 选择下/上一个改变
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <space>m :UndotreeToggle<cr>
"" 打开改动窗口自动定位光标到此窗口
let g:undotree_SetFocusWhenToggle=1
if has("persistent_undo")
  set undodir='~/.undodir/'
  set undofile
endif

"""" polyglot """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"":: vim-ruby
" 代码间移动: ]m, ]M, [m, [M, ]], ][, [[, []
" 代码文本对象: am/im方法, aM/iM模块
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ruby_indent_access_modifier_style='indent'


"""" YouCompleteMe """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 补全引擎, 包括tag补全, 路径补全, 标识符补全, 语法补全
" Ctrl-space: 触发补全
" <leader>d: 获取诊断条目的详细信息
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 映射声明和实现的跳转
nnoremap <leader>jd :YcmCompleter GoTo<cr>
"" 当获取语法诊断数据时自动打开位置列表,与syntastic配合
let g:ycm_always_populate_location_list=1
"" 注释中也进行补全
let g:ycm_complete_in_comments=1
"" 在注释中的标识符也会被收集到补全列表中
let g:ycm_collect_identifiers_from_comments_and_strings=1
"" 从tag文件中收集到补全列表中
let g:ycm_collect_identifiers_from_tags_files=1
"" 补全后关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
"" 在用户离开插入模式后关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion=1
"" 关闭对.ycm_extra_conf.py文件的安全载入对话
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfiles = 1


"""" syntastic """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 提供多语言的语法检查诊断, 会影响运行速度, 特别是保存时自动进行检查, 导致vim
" 直接会卡位好几秒, 特别是对Java代码, 以及代码量比较庞大时
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" " pip install cpplint
" let g:syntastic_cpp_cpplint_exec = 'cpplint'


"""" eclim """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 提供java代码补全, 但依赖eclipse, 会极大影响vim启动速度, 补全速度也很糟糕
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:EclimCompletionMethod='omnifunc'


"""" ultisnips """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码snippet补全引擎, 但依赖vim-snippets提供多语言的代码片断
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 编辑自定义snip的映射
nnoremap <leader>ue :UltiSnipsEdit<cr>
"" 编辑时窗口以垂直打开
let g:UltiSnipsEditSplit="vertical"
"" 自定义snip的目录
let g:UltiSnipsSnippetsDir="~/.vim/enali/UltiSnips"
"" snip扩展快捷键
let g:UltiSnipsExpandTrigger="<leader><tab>"
"" 下一个扩展, 同标识符可能多个snip
let g:UltiSnipsJumpForwardTrigger="<c-j>"
"" 上一个
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"""" vim-surround """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 处理分隔符的插件, 如删除,改变,添加分隔符, 指"", '', {}, []等
" ds: 删除环绕符
" cs: 改变环绕符
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" unite """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置为默认插入, 窗口10行的高度, 窗口在底部
" call unite#custom#profile('default', 'context', {
"       \ 'start_insert': 1,
"       \ 'winheight': 10,
"       \ 'direction': 'botright',
"       \})
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <silent> <space>o :<c-u>Unite file_rec/async:!<cr>
" nnoremap <silent> <space>b :Unite buffer<cr>
" if executable('ag')
"   " Use ag (the silver searcher) https://github.com/ggreer/the_silver_searcher
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = 
"         \ '-i --vimgrep --hidden ' . 
"         \ '--ignore ''.hg'' ' . 
"         \ '--ignore ''.svn'' ' .
"         \ '--ignore ''.git'' ' .
"         \ '--ignore ''.bzr'''
"   let g:unite_source_grep_recursive_opt = ''
" endif
" let g:unite_source_rec_async_command =
"       \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
" nnoremap <silent> <space>/ :<C-u>Unite -no-start-insert grep:.<cr>

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
"c-y若文件不存在时则创建
"打开新建文件时, 在当前窗口打开
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_user_caching = 0
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

"#### scala
