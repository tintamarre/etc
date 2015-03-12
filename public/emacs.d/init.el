(menu-bar-mode -1)
(column-number-mode t)
(ido-mode t)
; (display-time-mode 1)
(setq-default
 truncate-lines t
 comint-process-echoes t
 inhibit-startup-screen t
 display-time-24hr-format 1
 org-log-done 'time
 indent-tabs-mode nil
 )

; from http://stackoverflow.com/a/10439239
(setq tab-stop-list (number-sequence 4 200 4))

;; http://orgmode.org/manual/Activation.html#Activation
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; http://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal
;; http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html
(defun on-after-init ()
  (if (display-graphic-p (selected-frame))
    (load-theme 'wombat)))
(add-hook 'window-setup-hook 'on-after-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(indicate-empty-lines t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(truncate-lines t))

(put 'narrow-to-region 'disabled nil)

(set-face-attribute 'default nil :font "Source Code Pro Light 12" )

;; ELPA Configuration (http://www.emacswiki.org/emacs/ELPA)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
