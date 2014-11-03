(menu-bar-mode -1)
(column-number-mode t)
(ido-mode t)
; (display-time-mode 1)
(setq-default
 truncate-lines t
 comint-process-echoes t
 inhibit-startup-screen t
 display-time-24hr-format 1
 )

; (add-to-list 'load-path "~/.emacs.d/lisp/evil")
; (require 'evil)
; (evil-mode 1)
; (setq evil-default-cursor t)

;; http://orgmode.org/manual/Activation.html#Activation
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(frame-background-mode (quote dark))
 '(indicate-empty-lines t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(truncate-lines t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
