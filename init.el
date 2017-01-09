;; Get rid of ugly splash screen
(setq inhibit-startup-screen t)

;; Package settings
(require 'package)
(setq package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
                         ("melpa"        . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org"          . "http://orgmode.org/elpa/")))

(setq package-archive-priorities
        '(("org"          . 30)
          ("melpa-stable" . 20)
          ("gnu"          . 10)
          ("melpa"        . 0)))

(setq package-menu-hide-low-priority t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'bind-key)

(setq use-package-always-ensure t)

;; load other settings
(add-to-list 'load-path "~/.emacs.d/settings")

;; Theming
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-safe-themes t)
(load-theme 'material-light t)

;; Other visual stuff
(global-linum-mode 1)
(setq indicate-empty-lines -1)

;; adjust border
(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(require 'sane-defaults)
(require 'gui)
(require 'key-bindings)
(require 'defuns)


;; adjust opacity
(set-frame-parameter (selected-frame) 'alpha '(100 90))
(add-to-list 'default-frame-alist '(alpha 100 90))

;; highlight line
(global-hl-line-mode 1)

;; show line numbers dynamically with spaces
;; (defadvice linum-update-window (around linum-dynamic activate)
;;   (let* ((w (length (number-to-string
;;                      (count-lines (point-min) (point-max)))))
;;          (linum-format (concat "%" (number-to-string w) "d")))
;;     ad-do-it))

;; (set-face-background 'hl-line nil)

;; Font
;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :height 120
;;                     :weight 'normal
;;                     :width 'normal)





