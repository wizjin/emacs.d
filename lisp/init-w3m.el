(require-package 'w3m)

(require 'w3m)

(setq w3m-home-page "http://emacs-w3m.namazu.org/info/"
      w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(when *is-a-mac* (setq process-connection-type nil))

(provide 'init-w3m)
