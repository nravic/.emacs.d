;; Emacs config for languages

;; Flycheck/Company/Lsp-mode
(use-package flycheck
  :ensure t
  :disabled f
;; Flycheck
  (flycheck-mode 1))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :config (require 'lsp-clients))

;; Python
  (use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :hook
  (python-mode . lsp)
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

;; Rust
(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp))

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(use-package toml-mode)

;; Matlab


;; Javascript


;; sh

(provide 'config-languages.el)
