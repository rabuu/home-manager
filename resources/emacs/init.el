;;; init.el --- My Emacs Configuration  -*- lexical-binding: t; -*-
;; Author: rabuu

;;; Commentary:
;; The main Emacs configuration file.

;;; Code:

(defcustom my/icons-enabled t
  "Configuration for using Nerd Font symbols as icons."
  :type 'boolean
  :group 'appearance)


(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
		("nongnu" . "https://elpa.gnu.org/nongnu/")
		("melpa" . "https://melpa.org/packages/")))
(setq package-archive-priorities
      '(("gnu" . 3)
		("melpa" . 2)
		("nongnu" . 1)))

(use-package emacs
  :ensure nil
  :custom
  (column-number-mode t)
  (create-lockfiles nil)
  (make-backup-files nil)
  (delete-selection-mode 1)
  (global-auto-revert-non-file-buffers t)
  (inhibit-startup-message t)
  (switch-to-buffer-obey-display-actions t)
  (tab-always-indent 'complete)
  (tab-width 4)
  (truncate-lines t)
  (initial-scratch-message ";; Welcome to GNU Emacs!\n\n")

  :hook
  (prog-mode . display-line-numbers-mode)
  (prog-mode . hl-line-mode)
  (text-mode . hl-line-mode)

  :config
  (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 100)

  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)

  :init
  (global-auto-revert-mode 1)
  (savehist-mode 1)
  (file-name-shadow-mode 1)
  (electric-pair-mode t)

  (modify-coding-system-alist 'file "" 'utf-8)

  (load-theme 'modus-operandi))

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-lah --group-directories-first")
  (dired-dwim-target t)
  (dired-kill-when-opening-new-dired-buffer t)

  :hook
  (dired-mode . hl-line-mode))

(use-package diredfl
  :ensure t
  :init (diredfl-global-mode))

(use-package eldoc
  :ensure nil
  :init (global-eldoc-mode))

(use-package flymake
  :ensure nil
  :defer t
  :hook (prog-mode . flymake-mode))

(use-package which-key
  :ensure nil
  :defer t
  :hook (after-init . which-key-mode))

(use-package nerd-icons
  :if my/icons-enabled
  :ensure t
  :defer t)

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
  :custom
  (vertico-count 10)
  (vertico-resize nil)
  (vertico-cycle t))

(use-package orderless
  :ensure t
  :defer t
  :after vertico
  :custom
  (completion-styles '(orderless basic)))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package nerd-icons-completion
  :if my/icons-enabled
  :ensure t
  :after (:all nerd-icons marginalia)
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package consult
  :ensure t
  :defer t)

(use-package embark
  :ensure t
  :defer t)

(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package diff-hl
  :ensure t
  :defer t
  :hook
  (find-file . (lambda ()
				 (global-diff-hl-mode)
				 (diff-hl-flydiff-mode)
				 (diff-hl-margin-mode)))
  :custom
  (diff-hl-side 'left))

(use-package magit
  :ensure t
  :defer t)

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package vterm
  :ensure t)

(provide 'init)
;;; init.el ends here
