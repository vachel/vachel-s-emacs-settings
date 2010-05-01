;;========no auto-saving==============
(setq-default make-backup-files nil)


;;===================key setting===========
(global-set-key (kbd "C-;") 'set-mark-command)
;;=================libs================
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/myemacs/")


;;=======================python========================
;;(load-library "pythonsetting")

;;===========================c&c++===================== 
(load-library "c++setting")

;;===============company mode ===============
(add-to-list 'load-path "~/.emacs.d/company-0.5")
(autoload 'company-mode "company" nil t)
(setq company-idle-delay t)

;;===========================line number==================
(require 'linum)
(global-linum-mode 1)

;;=====================yasnippet==================
(require 'yasnippet)
(yas/initialize)
;;(setq yas/expand (kbd "C-TAB"))

;;========================cedet======================================
(load-library "cedetsetting")



;;============================others=======================
(setq global-font-lock-mode t) 
(ido-mode t)
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;(setq-default make-backup-files nil)
(global-set-key [(f5)] 'speedbar)
;;自动备份
(setq backup-by-copying t
backup-directory-alist '(("."."~/.backups"))
delete-old-versioins t
kept-new-versions 6
kept-old-versions 2
version-control t)
