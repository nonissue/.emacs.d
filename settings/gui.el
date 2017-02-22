;; Contains GUI settings and defuns

;; Good themes:

;; Dark variants:
;; avk-darkblue-white
;; heroku
;; busybee
;; doom
;; minimal (comes in light, great for writing)
;; sanityinc
;; darktooth
;; dracula
;; django *** (I like it, bit dark)
;; Lavender-theme *** (problem: highlight line looks ugly)
;; rebecca-theme ***
;; Reykjavik Theme *** (little flat with javascript)
;; * Subatomic Theme ***** current favorite. available in 256
;; purple haze (bit dark)
;; misteriso ***
;; soothe
;; tao
;; twilight?

;; Light:
;; Twilight Bright Theme

;; Get rid of ugly splash screen
(setq inhibit-startup-screen t)

;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-safe-themes t) ;; in case I want to use custom themes

;; Current appearance config
(use-package neotree)
(use-package subatomic-theme)

;; (use-package doom-themes
;;   :config
;;   (setq doom-neotree-enable-variable-pitch t
;;         doom-neotree-file-icons 'simple
;;         doom-neotree-line-spacing 3)
;;   ;; (load-theme doom-molokai t)
;;   ;; brighter source buffers
;;   (add-hook 'find-file-hook 'doom-buffer-mode)
;;   ;; Custom neotree theme
;;   (when window-system
;;     (require 'doom-neotree)))

;; (
(use-package all-the-icons)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (load-theme 'avk-darkblue-white)

;; (use-package apropospriate-theme
;;   :config
;;   (load-theme 'apropospriate-light t))

;; (load-theme 'apropospriate-dark)

(when window-system
    (require 'doom-neotree))

;; Have to use require here, annoying.
(use-package spaceline)
(require 'spaceline-config)
;; (spaceline-emacs-theme)
;; (spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(set-face-attribute 'mode-line nil :box nil)



(require 'all-the-icons)


;; adjust opacity
;; (set-frame-parameter (selected-frame) 'alpha '(99 90))
;; (add-to-list 'default-frame-alist '(alpha 100 90))

;; highlight line
(global-hl-line-mode 1)

;; Set alarm bell to visual warning
(setq visible-bell t)

;; disable superfluous gui
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

;; Other visual stuff
(global-linum-mode 1)
(setq indicate-empty-lines -1)

;; show line numbers dynamically with spaces
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;; adjust border
;;; (let ((no-border '(internal-border-width . 0)))
;;   (add-to-list 'default-frame-alist no-border)
;;   (add-to-list 'initial-frame-alist no-border))

;; Disable alarm bell when over-scrolling because it is annoying
;; (defun my-bell-function ()
;;   (unless (memq this-command
;;                 '(isearch-abort abort-recursive-edit exit-minibuffer
;;                                 keyboard-quit mwheel-scroll down up next-line previous-line
;;                                 backward-char forward-char))
;;     (ding)))

;; (setq ring-bell-function 'my-bell-function)


;; Cooool. The snippet below flashes modeline for bell
(defvar doom--modeline-bg nil)

(setq ring-bell-function
      (lambda ()
        (unless doom--modeline-bg
          (setq doom--modeline-bg (face-attribute 'mode-line :background)))
        (set-face-attribute 'mode-line nil :background "#54252C")
        (run-with-timer
         0.1 nil
         (lambda () (set-face-attribute 'mode-line nil :background doom--modeline-bg)))))

(defun font-exists-p (font)
  "Check that a font exists."
  (if (member font (font-family-list))
      t
    nil))

(when (font-exists-p "SF Mono")
  (set-frame-font "SF Mono-13"))

(provide 'gui)
