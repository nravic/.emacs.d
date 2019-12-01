;; Utils/UX stuff for emacs

;; Ivy/counsel/swiper
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)

  :config
  (setq ivy-height 15)
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :after ivy
  :init
  )

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

(provide 'config-misc.el)
