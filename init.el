;; My init file.
;; It's organized in it's own little way, and I've tried to keep it as clean as possible.
;; Let's see how long that lasts!

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Setup Melpa
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Keep your custom set variables away from me!
(setq custom-file (concat user-emacs-directory "/custom.el"))

;; load all custom el files
(require 'config-misc.el)
(require 'config-languages.el)

;; misc/QOL
(setq ring-bell-function 'ignore)

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
