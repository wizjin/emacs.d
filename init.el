;; Emacs Configuration
(when (version<= emacs-version "24")
  (message "Your Emacs is old. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; Color Theme
(add-to-list 'custom-theme-load-path
			 (expand-file-name "themes" user-emacs-directory))
(load-theme 'tomorrow-night-paradise t)
(setq color-theme-is-global t)

;; Init
(require 'init-misc)
(require 'init-elpa)
(require 'init-eshell)
(require 'init-golang)
;(require 'init-markdown)

(provide 'init)
