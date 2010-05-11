;;=========include path===========
;;(eval-after-load "semantic-c"
;;  '(dolist (d(list
;;	      "/usr/include/c++/4.4"
;;	      "/usr/include/c++/4.4/x86_64-linux-gnu"
;;	      "/usr/include/c++/4.4/backward"
;;	      "/usr/local/include"
;;	      "/usr/lib/gcc/x86_64-linux-gnu/4.4.3/include"
;;	      "/usr/lib/gcc/x86_64-linux-gnu/4.4.3/include-fixed"
;;	      "/usr/include"))
;;     (semantic-add-system-include d)))

;;补全弹出方式
(eval-after-load "semantic-complete"
  '(setq semantic-complete-inline-analyzer-displayor-classsemantic-displayor-ghost))
;;建立semanticdb数据库，用于保存分析的内容
(require 'semanticdb)
(setq-default semanticdb-default-save-directory
	      (expand-file-name "~/.emacs.d/semanticdb"))

;;补全快捷键
;;(local-set-key (kdb "M-/") 'semantic-complete-analyze-inline)
(local-set-key "." 'semantic-complete-self-insert)
(local-set-key ">" 'sementic-complete-self-insert)
(when (require 'semantic-ia nil t)
  (global-set-key [(control return)] 'semantic-ia-comlete-symbol-menu))
;;================project-include-dirs==============
(eval-after-load "semantic-c"
  '(dolist (d(list
	      "/usr/include/libxml2"
	      "/usr/include/mysql"
	      "/usr/include"))
     (semantic-add-system-include d)))
