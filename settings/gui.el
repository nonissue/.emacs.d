;; Contains GUI settings and defuns

;; Set alarm bell to visual warning
(setq visible-bell t)

;; disable superfluous gui
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(blink-cursor-mode -1)

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
