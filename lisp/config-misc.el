;; Utils/UX stuff for emacs

;; Ivy/counsel/swiper
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)

  :config
  (setq ivy-height 15)
  (global-set-key "\C-s" 'swiper)

  (setq ivy-re-builders-alist
	'((swiper . ivy--regex-plus)
	  (t . ivy--regex-ignore-order))))

(use-package counsel
  :ensure t
  :after ivy
  :init
  )

(use-package eyebrowse
  :ensure t
  :init
  (eyebrowse-mode t))

;; config misc misc
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; less useless help screen
(use-package helpful
 :ensure t
 :commands (helpful-callable helpful-variable)
 :init
 (global-set-key (kbd "C-h k") #'helpful-key)
 (global-set-key (kbd "C-h C") #'helpful-command)
 (global-set-key (kbd "C-h .") #'helpful-at-point)
 (global-set-key (kbd "C-h C-.") #'helpful-at-point))

;; Magit
(use-package magit
  :defer t
  ;; :commands magit-status
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (define-key magit-mode-map (kbd "C-TAB") nil)
  (define-key magit-mode-map (kbd "C-<tab>") nil)
  ;; (dolist (keymap (list magit-diff-mode-map magit-log-mode-map))
  ;;   (define-key keymap (kbd "C-TAB") nil)
  ;;   (define-key keymap (kbd "C-<tab>") nil))
  )

;; Avy
(use-package avy
  :ensure t
  :commands (avy-goto-word-1 avy-goto-char-2 avy-goto-char-timer)
  :bind (("M-m" . 'avy-goto-word-1)
         ("M-'" . 'avy-goto-char-2))
  )

;; Wrap-region
(use-package wrap-region
  :ensure t
  :init (wrap-region-mode 1))

;; UI stuff/themes/fonts
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-visual-line-mode 1)
(load-theme 'doom-one-light t)
(set-frame-font "Iosevka-11")

(use-package telephone-line
  :ensure t
  :init
  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
	telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
	telephone-line-primary-right-separator 'telephone-line-cubed-right
	telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
  (setq telephone-line-height 24
	telephone-line-evil-use-short-tag t)
  (telephone-line-mode t))

(provide 'config-misc.el)

;; move text
(use-package move-text
  :ensure t
  :bind
  ("M-u" . move-text-up)
  ("M-p" . move-text-down))
