; Init misc.

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t
      delete-by-moving-to-trash t
      transient-mark-mode t)

(menu-bar-mode -1)
(scroll-bar-mode t)
(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(auto-compression-mode t)
(recentf-mode t)
(show-paren-mode t)

;; IDO
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point t
      ido-max-prospects 10)

;; Backups & Autosave
(defconst emacs-backups-dir
  (expand-file-name "backups/" user-emacs-directory))
(defconst emacs-autosave-dir
  (expand-file-name "autosave/" user-emacs-directory))
(setq backup-directory-alist `((".*" . ,emacs-backups-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-autosave-dir t))
      auto-save-list-file-prefix emacs-autosave-dir)

;; Keyboard
(setq mac-command-modifier 'super)

;; Other
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
(defalias 'yes-or-no-p 'y-or-n-p)
(random t)

(provide 'init-misc)
