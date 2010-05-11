;;===============CEDET settings
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")
;;=================basic semantic
;;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;;============auto complete=============
(define-key c-mode-base-map (kbd "M-m") 'semantic-ia-complete-symbol-menu)
;;(define-key c-mode-base-map (kbd "TAB") 'semantic-ia-complete-symbol)
;;=================jump==========
(global-set-key [f12] 'semantic-ia-fast-jump)
;;==================switch between *.h and *.cpp =================
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)
;;===========EDE=========
(global-ede-mode t)

;;======= folding ============
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)


;;===============semantic==========
(load-library "semantic-include")