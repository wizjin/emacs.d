(require-package 'esqlite)
(require-package 'pcvs)
(require-package 'helm)
(require-package 'helm-dash)

(require 'esqlite)
(require 'pcvs)
(require 'helm-dash)

;;----------------------------------------------------------------------------
;; Helper functions
;;----------------------------------------------------------------------------
(defun wizjin/dash-path (docset)
  (if (string= docset "Emacs_Lisp")
      (concat (concat helm-dash-docsets-path "/") "Emacs Lisp.docset")
    (concat helm-dash-docsets-path "/"
            (nth 0 (split-string docset "_")) ".docset")))

(defun wizjin/dash-install (docset)
  (unless (file-exists-p (wizjin/dash-path docset))
    (helm-dash-install-docset docset)))

(defun wizjin/dash-hook ()
  (local-set-key (kbd "C-x C-h f") 'helm-dash)
  (local-set-key (kbd "C-x C-h g") 'helm-dash-at-point)
  (local-set-key (kbd "C-x C-h d") 'helm-dash-reset-connections))

(defun wizjin/dash-hook-golang ()
  (interactive)
  (setq-local helm-dash-docsets '("Go")))

(setq helm-dash-docsets-path (expand-file-name "docsets" user-emacs-directory))

(wizjin/dash-install "Go")
(wizjin/dash-install "Emacs_Lisp")

(setq helm-dash-common-docsets '("Go" "Emacs_Lisp"))
(setq helm-dash-min-length 2)
(if (fboundp 'w3m) (setq helm-dash-browser-func 'w3m))
(add-hook 'prog-mode-hook 'wizjin/dash-hook)
(add-hook 'go-mode-hook 'wizjin/dash-hook-golang)

(provide 'init-dash)
