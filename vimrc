"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 通用设定 """""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 设定为与vi非兼容
set nocompatible
set termguicolors

"""""""" 关于编辑区设定
"" 高亮搜索, 增量搜索
set incsearch hlsearch
"" 搜索时智能大小写敏感
set ignorecase smartcase
"" 显示行号和相对行号
set number relativenumber
"" 适当折行
set linebreak
"" 允许Ctrl-A和Ctrl-X加减字母
set nrformats+=alpha
"" 高亮第80列
set colorcolumn=80
"" 设置backspace功能
set backspace=indent,eol,start
"" 设置行宽度
" set textwidth=80
"" 开启文件类型检测
filetype plugin on
"" 开启语法高亮
syntax enable

"""""""" 关于缓冲区设定
"" 文件发生更改时自动读入
set autoread
"" 允许未保存缓冲区时编辑新文件
set hidden
"" 禁止备份文件
set nobackup

"""""""" 关于命令行和状态栏设定
"" 指定命令行高度
set cmdheight=2
"" 打开命令行补全
set wildmenu
"" 在命令行显示未完成命令
set showcmd
"" 因为lightline在状态栏显示模式
set noshowmode
"" 记录更多的Ex历史命令
set history=200
"" 在状态栏显示光标的行列号
set ruler
"" 指定状态栏显示方式
set laststatus=2

"""""""" 关于tab键
"" 自动插入缩进
set smartindent
"" 将<tab>键扩展为空格
set expandtab
"" 指定'>'缩进量
set shiftwidth=2
"" 指定tab键宽度
set softtabstop=2

"""""""" 关于代码折叠
"" 显示折叠栏
set foldcolumn=2
"" 是否开启代码折叠
"set foldenable
set nofoldenable
"" 指定代码折叠的方式
set foldmethod=syntax
"" 折叠只有在占据xx行或更多时才关闭
set foldminlines=15
"" 设置最大折叠层数
set foldnestmax=4

"" 设置前导字符, 默认\
let mapleader=","
"" 将\映射到反向重复查找','
nnoremap \ ,

"" 允许在命令行查询Man手册
runtime ftplugin/man.vim
"" 扩展%的功能, 不只分隔符, 还匹配关键字
runtime macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 快捷键映射 """""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" TODO: 开启粘贴模式
set pastetoggle=<F2>
"" 在命令行进行命令回溯
cnoremap <c-k> <up>
cnoremap <c-j> <down>
"" 在命令行将%%扩展为当前文件目录
cnoremap <expr> %% getcmdtype()==':' ? expand('%:h').'/':'%%'
"" 编辑.vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
"" 重载.vimrc
nnoremap <silent> <leader>ev :vsp $MYVIMRC<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 自定义命令 """""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 非特权下保存特权文件
command! Ws :w ! sudo tee % >/dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" vim-plug """""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
""用ascii码画画
Plug 'vim-scripts/DrawIt'
"" 提取代码的tab, 往往是类, 方法等
Plug 'majutsushi/tagbar'
"" 以边栏的形式提供文件树
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"" 提供可视化撤销树
Plug 'mbbill/undotree'
"" 提供多主题
Plug 'flazz/vim-colorschemes'
"" true color scheme
Plug 'KeitaNakamura/neodark.vim'
" Plug 'icymind/NeoSolarized'
"" 提供状态栏增强显示
Plug 'itchyny/lightline.vim'
"" 显示缩进对齐, 视觉辅助
Plug 'Yggdroot/indentLine'
"" 全功能补全插件, 特别是对c/cpp提供语义补全
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
"" 从特定构建系统, 为YCM生成.ycm_extra_conf
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
"" 开闭/显示/导航 标记
Plug 'kshenoy/vim-signature'
"" 提供语法或风格检查
Plug 'w0rp/ale'
"" 提供rails的增强
Plug 'tpope/vim-rails'
"" 提供haml, 另一种html模板
Plug 'tpope/vim-haml'
"" 方便文本分隔符的操作, 如添加, 删除, 修改等
Plug 'tpope/vim-surround'
"" 增强'.'的重复能力, 默认只能重复修改
Plug 'tpope/vim-repeat'
"" 提供智能结束符, 如}, end, fi等
Plug 'tpope/vim-endwise'
"" 提供gc注释操作符
Plug 'tpope/vim-commentary'
"" 提供各种列表遍历映射, 如]b即下一个缓冲区
Plug 'tpope/vim-unimpaired'
"" 使用c-a/x正确增加减少时间
Plug 'tpope/vim-speeddating'
"" 代码片断引擎
Plug 'SirVer/ultisnips'
"" 用于ultisnips的多语言代码片断
Plug 'honza/vim-snippets'
"" 快速html/css输入引擎, 缩写引擎
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
"" vim中文文档
Plug 'asins/vimcdoc'
"" fzf文件模糊搜索, dir表示插件安装在外部目录, do表示执行命令
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
"" 文本对齐插件
Plug 'junegunn/vim-easy-align'
"" 提供多语言的增强插件, 有些只是语法高亮
"Plug 'sheerun/vim-polyglot'
"" rust语言的增强插件
Plug 'rust-lang/rust.vim'
"" md文件的增强插件
Plug 'plasticboy/vim-markdown'
"" .dot文件的增强插件
Plug 'wannesm/wmgraphviz.vim'
"" go语言插件
Plug 'fatih/vim-go'
"" 自动调整左右窗口为黄金分割比
" Plug 'roman/golden-ratio'
"" 播放打字音效
Plug 'skywind3000/vim-keysound'
"" 无打扰打字模式
Plug 'junegunn/goyo.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 插件配置 """""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""" neodark """"""""""""""""""""""""""""""""""""
let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#background = '#202020'
" let g:neodark#use_256color = 1

"" 指定主题和背景色
" colorscheme seoul256 "256 color
colorscheme neodark "在neodark配置后面
"" 高亮当前行/列
set cursorline cursorcolumn
set background=dark


"""""""" lightline """"""""""""""""""""""""""""""""""""
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'


"""""""" DrawIt """""""""""""""""""""""""""""""""""""
" 描述: 画线
" 说明: 
" * <leader>di:  开始画
" * <leader>ds:  停止画
" * left/right/up/down/>/</pgdn/pgup
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""" tagbar """""""""""""""""""""""""""""""""""""
" 描述: 
" 说明:
" * x: 将窗口放大
" * q: 退出窗口
" * <c-n>, <c-p>: 下/上一个顶级tag
" * <space>: 显示tag的原型声明
"""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <space>t :TagbarToggle<cr>
"" 窗口开在左侧
let tagbar_left=1
"" 打开tag窗口时自动将光标定位到此窗口
let g:tagbar_autofocus=1
"" 以简洁格式显示tag窗口
let g:tagbar_compact=1
"" 窗口宽度30列
let g:tagbar_width=30


"""""""" nerdtree """""""""""""""""""""""""""""""""""
" 描述: 目录树插件
" 说明:
" * m: 打开文件操作菜单
" * I: 显示隐藏文件
" * ?: 显示帮助
"""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""" undotree """""""""""""""""""""""""""""""""""
" 描述: 文本改动窗口
" 说明:
" * >, <: 选择下/上一个改变
"""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <space>m :UndotreeToggle<cr>
"" 打开改动窗口自动定位光标到此窗口
let g:undotree_SetFocusWhenToggle=1
if has("persistent_undo")
  set undodir='~/.undodir/'
  set undofile
endif


"""""""" polyglot """""""""""""""""""""""""""""""""""
" 描述: 多语言增强插件
" 说明:
" * ]m, ]M, [m, [M, ]], ][, [[, []: 代码间移动
" * am/im方法, aM/iM模块: 代码文本对象
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" 禁用指定语言的插件
let g:polyglot_disabled = ['markdown','rust']
let g:ruby_indent_access_modifier_style='indent'


"""""""" YouCompleteMe """"""""""""""""""""""""""""""
" 描述: 补全引擎, 包括tag/标识符补全, 路径补全, 语义补全,
" snippet补全(依赖ultisnips)
" 说明:
" * Ctrl-space: 触发补全
" * <leader>d: 获取诊断条目的详细信息
" 命令:
" * :YcmDiags, 查看是否有错误和警告
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 映射声明和实现的跳转
nnoremap <leader>jd :YcmCompleter GoTo<cr>
"" 用于标识符补全引擎, 为触发补全用户至少要输入几个字符, 默认2
let g:ycm_min_num_of_chars_for_completion = 2
"" 显示语义补全建议的最大数目, 默认50
let g:ycm_max_num_candidates = 10
"" 显示标识符补全建议的最大数目, 默认10
"let g:ycm_max_identifier_candidates = 10
"" 是否关闭自动触发补全, 0表示关闭
"let g:ycm_auto_trigger = 1
"" 启动YCM的文件类型白名单和黑名单
"let g:ycm_filetype_whitelist/blacklist
"" 关闭语义补全引擎的文件类型
"let g:ycm_filetype_specific_completion_to_disable
"" 默认错误/警告符号
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>>'
"" 当获取语法诊断数据时自动打开位置列表,与syntastic配合
let g:ycm_always_populate_location_list=1
"" 注释中/字串中也进行补全
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
"" 是否保存YCM的日志文件(在其关闭后), 设置日志级别
" let g:ycm_keey_logfiles = 0
" let g:ycm_log_level = 'info'
"" 选择补全列表
let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']
"" 强制触发补全
let g:ycm_key_invoke_completion = '<c-j>'
"" 显示详细的诊断信息
"let g:ycm_key_detailed_diagnostics = '<leader>d'
"" 全局的ycm_extra_conf文件
"let g:ycm_global_ycm_extra_conf = ''
"" 配置不同语言的语义触发器
"let g:ycm_semantic_triggers = { ... }
"" 是否使用ultisnips补全
"let g:ycm_use_ultisnips_completer = 1
"" 在注释中的标识符也会被收集到补全列表中
" let g:ycm_collect_identifiers_from_comments_and_strings=1
"" 从tag文件中收集到补全列表中
let g:ycm_collect_identifiers_from_tags_files=1
"" 补全后关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
"" 在用户离开插入模式后关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion=1
"" 关闭对.ycm_extra_conf.py文件的安全载入对话
let g:ycm_confirm_extra_conf = 0
" let g:ycm_server_keep_logfiles = 1
let g:ycm_server_python_interpreter = 'python'
"" 用于运行jedi, python补全, 用于指定python的版本
let g:ycm_python_binary_path = 'python3'


"""""""" ultisnips """"""""""""""""""""""""""""""""""
" 描述: 代码snippet补全引擎, 但依赖vim-snippets提供多语言的代码片断
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 编辑自定义snip的映射
nnoremap <leader>ue :UltiSnipsEdit<cr>
"" 编辑时窗口以垂直打开
let g:UltiSnipsEditSplit="vertical"
"" 自定义snip的目录
let g:UltiSnipsSnippetsDir="~/.vim/enali/UltiSnips"
"" snip扩展快捷键
"let g:UltiSnipsExpandTrigger="<tab>"
"" 下一个扩展, 同标识符可能多个snip
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"" 上一个
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"""""""" YCM-Generator """"""""""""""""""""""""""""""
" 描述: 从支持的构建系统中, 为项目生成.ycm_extra_conf文件
"       用于YCM对于C家族语言的补全
" 说明: 
" * :YcmGenerateConfig, 为当前目录的项目生成文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""" fzf """"""""""""""""""""""""""""""""""""""""
" TODO:
"""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <c-p> :FZF<cr>


"""""""" vim-surround """""""""""""""""""""""""""""""
" 描述: 处理分隔符的插件, 如删除,改变,添加分隔符, 指"", '', {}, []等
" 说明:
" * ds: 删除环绕符
" * cs: 改变环绕符
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""" vim-markdown """""""""""""""""""""""""""""""
" next header         : ]],
" prev header         : [[,
" next sibling header : ][,
" prev sibling header : [],
" current header      : ]c,
" parent header       : ]u
" command: HeaderIncrese/HeaderDecrese
" Toc/Toch/Tocv/Toct  (header overview)
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1


"""""""" wmgraphviz """""""""""""""""""""""""""""""""
" <localleader>ll :GraphvizCompile
" <localleader>lv :GraphvizShow
" <localleader>li :GraphvizInteractive
" <localleader>lt :GraphvizCompileLaTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""" emmet-vim """"""""""""""""""""""""""""""""""
" 说明:
" * expand abbreviation or wrap with abbreviation: '<C-y>,'
" * select tag: '<C-y>d', '<C-y>D'
" * next edit point: '<C-y>n'
" * prev edit point: '<C-y>N'
" * remove tag: '<C-y>k'
" * split/join tag: '<C-y>j'
" * toggle comment: '<C-y>/'
" * make anchor from url: '<C-y>a'
" * make quoted text from url: '<C-y>A'
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""" delimitMate """"""""""""""""""""""""""""""""
" 描述: 自动补全", (, {, [等
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" 针对特定文件类型不会载入delimitMate脚本
" au FileType mail let b:loaded_delimitMate = 1
" 针对特定文件类型不会自动关闭分隔符
" au FileType mail let b:delimitMate_autoclose = 0
" 指定匹配的分隔符
" let delimitMate_matchpairs = "(:),[:],{:},<:>"
" let g:delimitMate_expand_cr = 1
" let g:delimitMate_expand_space = 1
" let g:delimitMate_jump_expansion = 1

"""""""" keysound """""""""""""""""""""""""""""""""""
" 通过:KeysoundEnable,KeysoundDisable启动和关闭打字音效
""""""""""""""""
" 指定使用的python版本
let g:keysound_py_version = 3
" 默认开启音效
" let g:keysound_enable = 1
" 选择音效主题
" let g:keysound_theme = 'default'
"

"""""""" goyo """""""""""""""""""""""""""""""""""""""
" :Goyo 打开
" :Goyo [dimension], 可设定宽高
" :Goyo! 关闭
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width = 80
" let g:goyo_height = 85%
" let g:goyo_linenr = 0
