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
	python-shell-interpreter-args "-i --simple-prompt")
  (highlight-indentation-mode -1))

;; Rust
(use-package rust-mode
  :ensure t)

(use-package cargo
  :ensure t
  :hook (rustic . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Matlab


;; Javascript
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :init
  (setq js2-highlight-level 3))

;; rainbow mode
(use-package rainbow-mode
  :ensure t
  :hook (js2-mode . rainbow-mode))

;; Julia
(use-package julia-repl
  :ensure t
  :hook (julia-repl . julia-mode))

;; Latex
(use-package latex
  :defer t
  :ensure auctex)

(provide 'config-languages.el)
