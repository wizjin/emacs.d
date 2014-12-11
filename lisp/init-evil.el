(require-package 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "`") 'smex)

(require-package 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "t" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(provide 'init-evil)
