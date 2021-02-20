; -*- coding: utf-8 -*-

(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq confirm-kill-emacs 'yes-or-no-p)
(set-frame-font "Consolas 11" nil t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(setq frame-title-format '(:eval (if (buffer-file-name) "%b - %f" "%b")))
(put 'dired-find-alternate-file 'disabled nil)
(global-set-key (kbd "M-/") 'hippie-expand)
(add-to-list 'safe-local-variable-values '(org-log-done . nil))

(desktop-save-mode t)
(global-auto-revert-mode t)
(setq
   backup-by-copying t
   backup-directory-alist '(("." . "~/.emacs.d/backups/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
(setq auto-save-visited-file-name t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")) 
(setq package-selected-packages '(magit undo-tree yaml-mode))
(package-initialize)

(require 'ox-md nil t)
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree")))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))

(add-hook 'org-mode-hook 'auto-fill-mode)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/Dropbox/Org")
(setq org-agenda-files '("~/Dropbox/Org"))
(setq org-agenda-archives-mode t)
(setq org-default-notes-file "~/Dropbox/Org/Notes.org")
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)
			   (nil :maxlevel . 1)))
(setq org-log-done 'note)
(setq org-log-into-drawer t)
(setq org-adapt-indentation nil)
