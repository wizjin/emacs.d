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

(defconst emacs-backups-dir
  (expand-file-name "backups/" user-emacs-directory))
(defconst emacs-autosave-dir
  (expand-file-name "autosave/" user-emacs-directory))
(setq backup-directory-alist `((".*" . ,emacs-backups-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-autosave-dir t)))
(setq auto-save-list-file-prefix emacs-autosave-dir)

(provide 'init-misc)
