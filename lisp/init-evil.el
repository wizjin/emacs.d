(require-package 'evil)
(evil-mode 1)
(evil-set-initial-state 'eshell-mode 'emacs)
(define-key evil-normal-state-map (kbd "`") 'smex)

(require-package 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "t" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  ;; Command
  "sc" 'shell-command
  ;; Windows
  "w" 'switch-window
  "s0" 'delete-window
  "s1" 'delete-other-windows
  "s2" 'split-window-vertically
  "s3" 'split-window-horizontally
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-3
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  "6" 'select-window-6
  "7" 'select-window-7
  "8" 'select-window-8
  "9" 'select-window-9
  )

(provide 'init-evil)
