;; Init Third-party Packages

;; Package
(require 'package)
(setq package-list '(evil smex auto-complete))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package) (package-install package)))

;; (require 'smex)
(smex-initialize)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c s-x") 'execute-extended-command)

;; (require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "`") 'smex)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "ac-dict" user-emacs-directory))
(ac-config-default)

(provide 'init-elpa)
