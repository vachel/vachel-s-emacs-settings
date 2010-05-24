
;;;; CC-mode配置  http://cc-mode.sourceforge.net/
(require 'cc-mode)
;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)
;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;;;;根据后缀判断所用的mode
;;;;注意：我在这里把.h关联到了c++-mode
(setq auto-mode-alist
(append '(("\\.h$" . c++-mode)) auto-mode-alist))
;;;;我的C/C++语言编辑策略
;; my c style
(defconst my-c-style
  '("stroustrup"
    (c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi
				   brace-else-brace
				   brace-elseif-brace))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)
;; define my cc-mode hook
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; hungry delete
  (c-toggle-auto-hungry-state 1)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;============== for c++ ===========
(defun my-c++-mode-hook()
(setq tab-width 4 indent-tabs-mode nil)
(c-set-style "PERSONAL")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;;==================company mode============================
(add-hook 'c++-mode-hook 
	  (lambda ()
	    (setq company-idle-delay t)
	    (company-mode)))
