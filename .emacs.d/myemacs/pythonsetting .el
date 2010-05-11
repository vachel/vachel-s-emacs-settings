;;python
(add-to-list 'load-path "~/.emacs.d/")
(require 'smart-operator)
;;yasnippet
;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/snippets")
;;
;;(load-library "init_python")
;;python mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
(add-hook 'python-mode-hook
      (lambda ()
	(set-variable 'py-indent-offset 4)
	;(set-variable 'py-smart-indentation nil)
	(set-variable 'indent-tabs-mode nil)
	(define-key py-mode-map (kbd "RET") 'newline-and-indent)
	;(define-key py-mode-map [tab] 'yas/expand)
	;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
	(smart-operator-mode-on)
	))
;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
;;pycomplete
(require 'pymacs)
(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode) interpreter-mode-alist))
;;auto complete
;;(require 'auto-complete)
;;(global-auto-complete-mode t)
;;(setq-default ac-sources '(ac-source-abbrev ac-source-words-in-buffer))
;;(set-face-background 'ac-candidate-face "lightgray")
;;(set-face-underline 'ac-candidate-face "darkgray")
;;(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看
;;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Syntax Error Hightlight
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)
;;ipython
(require 'ipython)
(setq py-python-command "/usr/bin/ipython")
;;(setq py-python-command-args '("-pylab" "-colors" "LightBG"))


(put 'dired-find-alternate-file 'disabled nil)
