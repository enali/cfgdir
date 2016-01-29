;;; 添加melpa源
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
;;; 个人信息
(setq user-full-name "enali")
(setq user-mail-address "enalix@163.com")
;;; 设置背景颜色
;(set-background-color "black")
;(set-foreground-color "white")
;;; 显示行号
(global-linum-mode 1)
;;; 去除工具栏/菜单栏/滚动条
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;; minibuffer中启用自动补全函数和变量
(icomplete-mode 1)
;;; 在minibuffer中显示行列号
(line-number-mode 1)
(column-number-mode 1)
;;; 允许minibuffer自由改变大小
(setq resize-mini-window t)
;;; 提示y/n
(fset 'yes-or-no-p 'y-or-n-p)
;;; 允许自动打开图片/压缩文件
(auto-image-file-mode 1)
(auto-compression-mode 1)
;;; 设置行宽
(setq default-fill-column 60)
;;; 禁止光标闪烁
;(blink-cursor-mode -1)
;(setq-default cursor-type 'bar)
;;; 去除Emacs/Gnus/Scratch启动引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-start-message t)
(setq initial-scratch-message nil)
;;; 文末自动插入空行
(setq require-final-newline t)
(setq track-eol t)
;;; 设置移除记录数量
(setq kill-ring-max 200)
;;; 扩展函数与变量的查找范围
;(setq apropos-do-all t)
;;; 设置aspell作拼写检查
(setq-default ispell-program-name "aspell")
;;; 启动时上下窗口
;(split-window-vertically)
;;; 启动时左右窗口
;(split-window-horizontally)
;;; 允许emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;;; 高亮行
(global-hl-line-mode t)
;;; 标题栏显示buffer名称
(setq frame-title-format "%b@emacs")
;;; 快捷键设置
;;; 编译
(global-set-key [f7] 'compile)
(setq-default compile-command "make")
;;; 调试
(global-set-key [c-f7] 'gdb)
(global-set-key [c-f8] 'previous-error)
(global-set-key [f8] 'next-error)
;;; 格式化代码
(global-set-key [f9] 'c-indent-line-or-region)
;;; 注释／取消注释
(global-set-key [f10] 'comment-or-uncoment-region)
;;; 禁止生成临时文件
(setq-default make-backup-files nil)
;;; 禁止自动保存
(auto-save-mode -1)
;;; 打开最近打开的文档
(recentf-mode 1)
(global-set-key (kbd "C-c o") 'recentf-open-files)
;;; 保存上次session, 默认保存为"~/.emacs.d/.emacs.desktop"
;(desktop-save-mode t)
;;; 默认只使用空格缩进
(setq-default indent-tabs-mode nil)
;;; 默认tab宽度4个空格
(setq-default tab-width 4)
;(setq tab-width 4) ; for current buffer
;;; tab总是缩进
;(setq-default tab-always-indent t)
;;; tab依光标位置进行缩进或插入tab符
;(setq-default tab-always-indent nil)
;;; tab先缩进后补全
(setq-default tab-always-indent 'complete)
;;; <ret>缩进
(electric-indent-mode t)
;(electric-indent-local-mode t) ; for current buffer
;;; 编码
;(set-buffer-file-coding-system 'utf-8)
;(setq default-buffer-file-coding-system 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(setq file-name-coding-system 'utf-8)
;;; 设置默认启动主模式
(setq default-major-mode 'text-mode)
;;; ibus
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;;; 光标靠近鼠标时让鼠标自动走开
(mouse-avoidance-mode 'jump)
;;; user Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)
;;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t)
