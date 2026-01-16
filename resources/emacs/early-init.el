;;; early-init.el --- My Emacs Configuration (early-init)  -*- lexical-binding: t; -*-
;; Author: rabuu

;;; Commentary:
;; Settings before the main initialization process.

;;; Code:

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      ring-bell-function 'ignore
      use-dialog-box t
      use-file-dialog nil
      use-short-answers t
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      inhibit-startup-echo-area-message user-login-name
      inhibit-startup-buffer-menu t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 1024 1024 8)
		  gc-cons-percentage 0.1
		  read-process-output-max (* 1024 1024 4))))

(setq package-enable-at-startup t)

(provide 'early-init)
;;; early-init.el ends here
