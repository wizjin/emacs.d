(require-package 'go-mode)
(require 'go-mode-autoloads)

(require-package 'go-autocomplete)
(require 'go-autocomplete)

(defun go/run ()
  "Run current buffer"
  (interactive)
  (shell-command (concat "go run \"" (buffer-file-name) "\"")))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "<f5>") 'go/run)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "M-.") 'godef-jump)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r")
                                         'go-remove-unused-imports)))

(provide 'init-golang)
