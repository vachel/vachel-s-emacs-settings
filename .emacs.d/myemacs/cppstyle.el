;;Create MyCppStyle
(require 'cc-mode)
(defconst MyCppStyle
'((c-tab-always-indent . t)
  (c-comment-only-line-offset . 0)
  (c-hanging-braces-alist . ((substatement-open after)
			     (brace-list-open)))
  (c-cleanup-list . (comment-close-slash
		     compact-empty-funcall))
  (c-offsets-alist . ((substatement-open . 0)
		      (innamespace . 0)                           ;;在namespace中不缩进
		      (case-label      . +)                          ;;case标签缩进一个c-basic-offset单位
		      (access-label . -)                             ;;private/public等标签少缩进一单位
		      (inline-open . 0)                             ;;在.h文件中写函数，括号不缩进
		      (block-open     . 0)))                       ;;在一个新块开始时不缩进
;;    (c-echo-syntactic-information-p t)
  (setq comment-start "/*"
	  comment-end "*/")
  (setq indent-tabs-mode nil))
"My Cpp Coding Style")
(c-add-style "MyCppStyle" MyCppStyle)                   ;;定义完自己的style，将其添加到cc-mode的style中。
;;Define own hook
(defun MyCppHook ()
(company-mode)
(setq indent-tabs-mode nil)
(setq global-hl-line-mode t)
(c-set-style "MyCppStyle"))                                   ;;设置这个hook对应于MyCppStyle
(add-hook 'c++-mode-hook 'MyCppHook)                ;;将此hook应用于所有的c++模式。
    ;;最后，可以设置对于不同的文件绑定不同的模式，可以用以下语句实现：
;;set *.h and *.c and *.cpp files use c++ mode
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cpp$" . c++-mode) auto-mode-alist))

;;==================company mode============================
(add-hook 'c++-mode-hook 
	  (lambda ()
	    (setq company-idle-delay t)
	    (company-mode)))
