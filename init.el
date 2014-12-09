;; Emacs Configuration
(when (version<= emacs-version "24")
  (message "Your Emacs is old. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; Package
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Color Theme
(require 'tomorrow-night-paradise-theme)
(setq color-theme-is-global t)

;; Init
(require 'init-misc)
(require 'init-elpa)

(provide 'init)
