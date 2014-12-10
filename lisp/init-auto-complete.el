(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "ac-dict" user-emacs-directory))
(ac-config-default)

(provide 'init-auto-complete)
