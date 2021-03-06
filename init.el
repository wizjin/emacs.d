;; -*- lexical-binding: t -*-

;; Emacs Configuration
(when (version< emacs-version "24.5")
  (message "Your Emacs is old. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
          (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp)
;; Calls (package-initialize)
(require 'init-elpa)
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-smex)
(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)


(require 'init-git)

(require 'init-projectile)

(require 'init-compile)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-javascript)
(require 'init-html)
(require 'init-css)
(require 'init-python-mode)
(require 'init-yaml)
(require 'init-docker)
(maybe-require-package 'terraform-mode)

(require 'init-paredit)
(require 'init-lisp)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))


(when *is-a-mac*
  (require-package 'osx-location))
(maybe-require-package 'regex-tool)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))



(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
