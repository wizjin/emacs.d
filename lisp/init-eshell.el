;; Init EShell

(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last three."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 3)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                    (substring elm 0 1)))
                    (butlast p-lst 3)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 3)
                    "/"))
      (mapconcat (lambda (elm) elm)
                 p-lst
                 "/"))))

(defun cur-dir-git-branch-string (pwd)
  "Return current git branch as a string.

If PWD is in a git repo and the git command is found, then return the	
current git branch as a string.  Otherwise return an empty string."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let* ((git-cmd "git branch")
           (grep-cmd "grep '\\*'")
           (sed-cmd "sed -e 's/^\\* //'")
           (git-output (shell-command-to-string
                        (concat git-cmd " | " grep-cmd " | " sed-cmd))))
      (concat "[g:"
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "]"))))

(defun trs-eshell-prompt-fn ()
  "A customized eshell prompt function.

The main features of this prompt are that it:

- shortens directory names if the path gets too long
- replaces the HOME path with the tilde (~) character
- shows the current git branch if you're in a git repo"
  (concat
   (with-face user-login-name :foreground "darkslateblue" :weight 'bold)
   (with-face ":" :foreground "thistle" :weight 'bold)
   (with-face (concat (cur-dir-git-branch-string (eshell/pwd)))
              :foreground "purple" :weight 'light)
   (with-face (pwd-shorten-dirs (pwd-replace-home (eshell/pwd)))
              :foreground "dimgrey" :weight 'bold)
   (if (= (user-uid) 0)
       (with-face "#" :foreground "brown" :weight 'ultra-bold)
       (with-face "$" :foreground "seagreen" :weight 'ultra-bold))
   " "))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
(setq eshell-prompt-function 'trs-eshell-prompt-fn)

(defun eshell/clear ()
  "Clear the eshell buffer function."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (message "Erase eshell buffer")))

(provide 'init-eshell)
