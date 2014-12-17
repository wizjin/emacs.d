; Init misc.

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq delete-by-moving-to-trash t
      transient-mark-mode t)

(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(auto-compression-mode t)
(recentf-mode t)
(show-paren-mode t)

;; Backups & Autosave
(defconst emacs-backups-dir
  (expand-file-name "backups/" user-emacs-directory))
(defconst emacs-autosave-dir
  (expand-file-name "autosave/" user-emacs-directory))
(setq backup-directory-alist `((".*" . ,emacs-backups-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-autosave-dir t))
      auto-save-list-file-prefix emacs-autosave-dir)

;; Keyboard
(when *is-a-mac*
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (kbd (concat "<" multiple "wheel-" direction ">"))
                      'ignore))))

(global-set-key (kbd "<s-f1>") 'find-file)

;; Tramp
(setq tramp-default-method "ssh")

;; Indent & Tabs
(set-default 'indent-tabs-mode nil)
(setq-default tab-width 4)
(setq show-trailing-whitespace t)
(custom-set-variables '(tab-stop-list (quote (number-sequence 4 200 4))))

;; Other
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
(defalias 'yes-or-no-p 'y-or-n-p)
(random t)

(provide 'init-misc)
