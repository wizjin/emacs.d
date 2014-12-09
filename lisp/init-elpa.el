;; Init Third-party Packages

;; (require 'smex)
(smex-initialize)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c s-x") 'execute-extended-command)

;; (require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "`") 'smex)

(provide 'init-elpa)
