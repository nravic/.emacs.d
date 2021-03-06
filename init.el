;; My init file.
;; It's organized in it's own little way, and I've tried to keep it as clean as possible.
;; Let's see how long that lasts!

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'package)
;; Setup Melpa
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(require 'package)
(require 'use-package)

;; load all custom el files
(require 'config-misc.el)
(require 'config-languages.el)
(require 'config-org.el)
(require 'company-org-roam)
(require 'org-roam-protocol)
(push 'company-org-roam company-backends)

;; misc/QOL
(setq ring-bell-function 'ignore)

;; custom el
(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; cleaner backups
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))

;; goodbye buffer (and save)
(global-set-key (kbd "<C-delete>")
                (lambda () (interactive)
                  (funcall (if (string= (buffer-name) "*scratch*")
                               'bury-buffer
                             (lambda ()
                               (and (buffer-file-name) (save-buffer))
                               (kill-buffer))))))

;; use my bashrc path
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

;; if using a macbook and want to move command to ctrl 
(setq mac-command-modifier 'control)
