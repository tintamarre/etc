(column-number-mode 1)
(ido-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode -1)

(setq-default
 truncate-lines t
 comint-process-echoes t
 inhibit-startup-screen t
 display-time-24hr-format 1
 org-log-done 'time
 indent-tabs-mode nil
 indicate-empty-lines t
 frame-background-mode 'dark
 )

(setq default-frame-alist
      '((font . "DejaVu Sans Mono 11")
        ;(tool-bar-lines . 0)
        ;(menu-bar-lines . 0)
        ;(vertical-scroll-bars . nil)
        (width . 80)
        (height . 24)
        ))

;; Set indendentation preferences

; from http://stackoverflow.com/a/10439239
(setq tab-stop-list '(2 4 6))

; from http://stackoverflow.com/a/9210502
(defun r-text-indent ()
    (interactive)
    (tab-to-tab-stop))
;(defun r-text-backspace ()
;    (interactive)
;    (forward-char -4))
(add-hook 'emacs-lisp-mode-hook
    (lambda ()
        (setq
            tab-stop-list '(4 8 12)
            indent-line-function 'r-text-indent
        )))

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
    (load-theme 'wombat t)))
(add-hook 'window-setup-hook 'on-after-init)

(put 'narrow-to-region 'disabled nil)

;; ELPA Configuration (http://www.emacswiki.org/emacs/ELPA)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
