(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n"))
(guide-key-mode 1)
(diminish 'guide-key-mode)

(provide 'init-editing-utils)
