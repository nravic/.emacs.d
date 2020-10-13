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
  :hook ((rust-mode python-mode) . lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends)) ;; add company-lsp as a backend

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
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Matlab


;; Javascript/React
;; From the tide README
(defun setup-tide-mode ()
  "Set up Tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (js2-mode company flycheck)
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))
  
;; rainbow mode
(use-package rainbow-mode
  :ensure t
  :hook (rjsx-mode . rainbow-mode))


;; Julia
(use-package julia-repl
  :ensure t
  :hook (julia-repl . julia-mode))


;; Latex
(use-package latex
  :defer t
  :ensure auctex)


;; C/Cpp
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))


;; Scheme/Lisp
(use-package geiser
  :ensure t)

(use-package paredit
  :ensure t
  :hook (scheme-mode, common-lisp-mode))

;; SICM stuff
(defun mechanics ()
 "Run mit-scheme with SCMUTILS loaded, to work with (Structure
and Interpretation of Classical Mechanics) - The book."
 (interactive)
 (setenv "MITSCHEME_BAND" "mechanics.com")
 (setenv "MITSCHEME_HEAP_SIZE" "100000")
 (run-scheme
  "/usr/bin/mit-scheme --library /home/nravic/bin/scmutils-20200810/")
 )


(provide 'config-languages.el)
