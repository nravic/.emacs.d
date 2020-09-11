;; org-specific configs

;; get those ugly headers away from me
(custom-set-faces '(org-level-1 ((t
				    (:height 1.0 :weight bold)))))
(custom-set-faces '(org-level-2 ((t
				    (:height 1.0 :weight bold)))))
(custom-set-faces '(org-level-3 ((t
				    (:height 1.0 :weight bold)))))

;; org-roam
(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/notes/wiki/")
      (org-roam-completion-system 'ivy)
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

;; org-roam server
(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
	org-roam-server-port 8081
	org-roam-server-authenticate nil
	org-roam-server-export-inline-images t
	org-roam-server-serve-files nil
	org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
	org-roam-server-network-poll t
	org-roam-server-network-arrows nil
	org-roam-server-network-label-truncate t
	org-roam-server-network-label-truncate-length 60
	org-roam-server-network-label-wrap-length 20))


;; deft 
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/notes/wiki/"))


;; citing/pdfs



(provide 'config-org.el)
