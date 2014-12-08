; Emacs Configuration
(when (version<= emacs-version "24")
  (message "Your Emacs is old. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-misc)

; Color Theme
(require 'tomorrow-night-paradise-theme)
(setq color-theme-is-global t)

(provide 'init)
