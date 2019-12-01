;; Emacs config for languages

;; Flycheck
(use-package flycheck
  :disabled t
  :init
  (flycheck-mode 1))

(use-package company
  :hook 

;; Python
  (use-package elpy
  :ensure t
  :init
  :hook
  (advice-add 'python-mode
              :before 'elpy-enable
              )
  (pyenv-mode)
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

;; Rust
(use-package toml-mode)

;; Matlab


;; Javascript


;; sh

