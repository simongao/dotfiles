;; -*-Emacs-Lisp-*-

;; 在标题栏显示buffer的名字
(setq frame-title-format "emacs %b")

;; 显示行号
(global-linum-mode t)

;; 把缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)

;;设置中文语言环境
;;(set-language-environment 'Chinese-GB)
(set-language-environment 'English)

;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

;;;; flyspell 
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t)
(autoload 'tex-mode-flyspell-verify "flyspell" "" t)
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
 
;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
(set-buffer-file-coding-system 'utf-8)
 
;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)
 
;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)
 
;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312)
 
;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8)
 

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; set aspell as default spell checker 
(setq-default ispell-program-name "aspell") 

;; fix flyspell problem
(setq flyspell-issue-welcome-flag nil)

;; set fly-on-spell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t) 
(autoload 'tex-mode-flyspell-verify "flyspell" "" t) 

;;指针不闪，不恍花眼睛。
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;设置有用的个人信息.这在许多地方有用。
(setq user-full-name "Simon Gao")
(setq user-mail-address "simon.gaoy@gmail.com")

;;所有的备份文件都放置在~/backups目录下
(setq backup-directory-alist (quote (("." . "~/backups"))))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(word-wrap t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;; CC-mode配置  http://cc-mode.sourceforge.net/
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;;;;我的C/C++语言编辑策略

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  ;;按键定义
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

(require 'cedet)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; Enable EDE project management 
;(global-ede-mode t)

;; Enable tag folding
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)

;; Associate key shotcut for tag folding
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)


;(load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")

(setq semanticdb-project-roots 
      (list
        (expand-file-name "/")))
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
      (hippie-expand nil)
      (indent-for-tab-command))
 )

(global-set-key [(control tab)] 'my-indent-or-complete)

(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)


(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

;; Associate F5 to speedbar for quickly switch between multiple files
(global-set-key [(f5)] 'speedbar)

(define-key c-mode-base-map [(f7)] 'compile)

'(compile-command "make")
