;;----------------------------------------------------------------------------
;; sane defaults?
;;----------------------------------------------------------------------------

;; fix scratch buffer
(setq initial-scratch-message "Shouldn't you be trawling Stack Overflow?")
(setq initial-major-mode 'emacs-lisp-mode)

;; shorten yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; indent with spaces
(setq-default indent-tabs-mode nil)

;; back up configuration
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup")))
(setq version-control t)
(setq delete-old-versions t)

;; autosave configuration
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/")
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t)))

;; display buffer name in frame title
(setq frame-title-format
      '("" invocation-name ": " (:eval (replace-regexp-in-string
                                        "^ +" "" (buffer-name)))))

;; display fringe in visual line mode
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; save other app clipboard to kill ring if possible
(setq save-interprogram-paste-before-kill t)

;; move recentf save files
(setq recentf-save-file "~/.emacs.d/etc/recentf"
      recentf-max-saved-items 50)

;; move M-? save files
(setq savehist-file "~/.emacs.d/etc/savehist"
      history-length 150)

;; move save place in file
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/etc/saveplace")

;; move bookmarks
(setq bookmark-default-file "~/.emacs.d/etc/bookmarks")

;; Change scrolling behaviour
;; (Maybe make this laptop only?)
(setq scroll-conservatively 101)
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; Clean up whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)


(provide 'sane-defaults)
