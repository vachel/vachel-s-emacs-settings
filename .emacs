;;no auto-saving
(setq-default make-backup-files nil)
;;key setting
(global-set-key (kbd "C-;") 'set-mark-command)
;;python
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/myemacs/")
(load-library "pythonsetting")
;;cc-mode
;;(add-to-list 'load-path "~/.emacs.d/cc-mode")
(load-library "c++setting")
;;line number
(require 'linum)
(global-linum-mode 1)
;;yasnippet
;;(require 'yasnippet)
;;(yas/initialize)
;;(setq yas/expand (kbd "C-TAB"))
;;CEDET
(load-library "cedet")
;;others
(setq global-font-lock-mode t) 
(ido-mode t)
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq frame-title-formart "emacs@%b")
;;(setq-default make-backup-files nil)
(global-set-key [(f5)] 'speedbar)
;;自动备份
(setq backup-by-copying t
backup-directory-alist '(("."."~/.backups"))
delete-old-versioins t
kept-new-versions 6
kept-old-versions 2
version-control t)