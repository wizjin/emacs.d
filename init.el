;; Emacs Configuration
(when (version<= emacs-version "24")
  (message "Your Emacs is old. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))

;; Color Theme
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))
(load-theme 'tomorrow-night-paradise t)
(setq color-theme-is-global t)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-misc)
(require 'init-utils)
(require 'init-elpa)		;; Machinery for installing required packages
(require 'init-exec-path)	;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-package 'diminish)
(require-package 'scratch)

(require 'init-frame-hooks)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-ibuffer)

(require 'init-recentf)
(require 'init-ido)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-evil)
(require 'init-w3m)

(require 'init-compile)
(require 'init-golang)
(require 'init-markdown)
(require 'init-eshell)

(require 'init-dash)

(provide 'init)
