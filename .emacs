; -*- coding: utf-8 -*-

(set-default-coding-systems 'utf-8)

(add-hook 'org-mode-hook 'auto-fill-mode)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files '("~/Dropbox/Org"))
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)
			   (nil :maxlevel . 1)))
(setq org-log-done 'note)
(setq org-log-into-drawer 't)
(setq org-adapt-indentation nil)
