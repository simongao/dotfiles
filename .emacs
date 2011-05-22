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
