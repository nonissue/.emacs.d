;; Contains GUI settings and defuns

;; Get rid of ugly splash screen
(setq inhibit-startup-screen t)


;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-safe-themes t) ;; in case I want to use custom themes

;; (use-package doom-themes) ;; main theme
;; (load-theme 'doom-molokai t)
;; (use-package heroku-theme) ;; alternate
(load-theme 'heroku t)
;; (load-theme 'spacedust t)

;; Other good themes
;; * heroku
;; * bubble or something

;; Have to use require here, annoying.
(use-package spaceline)
(require 'spaceline-config)
(spaceline-emacs-theme)

;; (require 'all-the-icons)


;; adjust opacity
(set-frame-parameter (selected-frame) 'alpha '(99 90))
(add-to-list 'default-frame-alist '(alpha 100 90))

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
(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

;; Disable alarm bell when over-scrolling because it is annoying
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))

(setq ring-bell-function 'my-bell-function)

(defun font-exists-p (font)
  "Check that a font exists."
  (if (member font (font-family-list))
      t
    nil))

(when (font-exists-p "SF Mono")
  (set-frame-font "SF Mono-12"))

(provide 'gui)
