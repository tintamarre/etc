(menu-bar-mode -1)
(column-number-mode t)
(ido-mode t)
(display-time-mode 1)
(setq-default truncate-lines t
              comint-process-echoes t
              inhibit-startup-screen t
              display-time-24hr-format 1)

(load-theme 'wombat t)

;; http://stackoverflow.com/a/1867000
;(when window-system
;    (tool-bar-mode -1)
;    ;(set-face-attribute 'default nil :font "Terminus Bold 18")
;    (set-face-attribute 'default nil :font "Inconsolata 14")
;
;    ;; http://www.emacswiki.org/emacs/FrameSize#toc4
;    (add-to-list 'default-frame-alist '(height . 25))
;    (add-to-list 'default-frame-alist '(width . 80))
;)

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
 '(frame-background-mode (quote dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
