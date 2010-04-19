;;把c语言风格设置为k&r风格
;;(add-hook 'c-mode-hook
;;'(lambda ()
;;(c-set-style "k&r")))

;;把C++语言风格设置为stroustrup风格
(add-hook 'c++-mode-hook
'(lambda()
(c-set-style "stroustrup")))
;;hideshow
;;能把一个代码块缩起来，需要的时候再展开
;;  M-x              hs-minor-mode
;;  C-c @ ESC C-s    show all
;;  C-c @ ESC C-h    hide all
;;  C-c @ C-s        show block
;;  C-c @ C-h        hide block
;;  C-c @ C-c toggle hide/show
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(dolist (hook (list 'emacs-lisp-mode-hook 'c++-mode-hook))
(add-hook hook 'hideshowvis-enable))
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。
;;不起作用？
;;导入CEDET
(load-file "~/.emacs.d/cedet/common/cedet.el")
(setq semantic-load-turn-everything-on t) 

(setq semanticdb-project-roots 
        (list
        (expand-file-name "/")))
;;配置Semantic的检索范围

(setq semanticdb-default-save-directory "~/.emacs.d")
;;设置semantic.cache路径
;;自定义自动补齐命令
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
 	  (indent-for-tab-command))
 )

(global-set-key [(control tab)] 'my-indent-or-complete)
(global-set-key [(meta ?/)] 'hippie-expand)
;;M-/ 绑定到 hippie-expand

(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list 
      '(senator-try-expand-semantic  ;优先调用了senator的分析结果
        try-expand-dabbrev     ;当前的buffer补全
 try-expand-dabbrev-visible   ;别的可见的窗口里寻找补全
 try-expand-dabbrev-all-buffers  ;所有打开的buffer
 try-expand-dabbrev-from-kill
 try-complete-file-name-partially
 try-complete-file-name
 try-expand-all-abbrevs
 try-expand-list
 try-expand-line
 try-complete-lisp-symbol-partially
 try-complete-lisp-symbol))
;设置 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全。
(define-key c++-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c++-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)