; Emacs config for languages

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
  :hook ((rust-mode python-mode) . lsp)
  :config (require 'lsp-clients))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)


(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package yasnippet
  :ensure t)

;; Python
  (use-package elpy
  :ensure t
  :hook
  (python-mode . elpy-enable)

  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

;; Rust
(use-package rust-mode
  :ensure t)

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Matlab


;; Javascript


;; sh

(provide 'config-languages.el)
