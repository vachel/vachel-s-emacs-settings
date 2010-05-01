;;;; CC-mode配置  http://cc-mode.sourceforge.net/
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;;;;根据后缀判断所用的mode
;;;;注意：我在这里把.h关联到了c++-mode
(setq auto-mode-alist
(append '(("\\.h$" . c++-mode)) auto-mode-alist))
;;;;我的C/C++语言编辑策略

(defun my-c-mode-common-hook()
(setq tab-width 4 indent-tabs-mode nil)
;;; hungry-delete and auto-newline
(c-toggle-auto-hungry-state 1)
;;
;;按键定义
(define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
(define-key c-mode-base-map [(return)] 'newline-and-indent)
(define-key c-mode-base-map [(f7)] 'compile)
(define-key c-mode-base-map [(f8)] 'ff-get-other-file)
(define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;;(define-key c-mode-base-map [(tab)] 'hippie-expand)
;;(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(control tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;预处理设置
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq hs-minor-mode t)
(setq abbrev-mode t)
(setq tab-width 4 indent-tabs-mode nil)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook
'(lambda ()
(c-set-style "Stroustrup")))

;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
(setq tab-width 4 indent-tabs-mode nil)
(c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;;==================company mode============================
(add-hook 'c++-mode-hook 
	  (lambda ()
	    (setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")	
	    (semantic-load-enable-code-helpers)
	    (semantic-load-enable-semantic-debugging-helpers)
	    (setq company-idle-delay t)
	    (company-mode)))
