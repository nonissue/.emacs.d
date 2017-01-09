(global-set-key (kbd "M-/")           'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x k")         'kill-this-buffer-volatile)

;; I've intermittently played with changing these, but prefer it this way now
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; Navigation stuff
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

;; Geoff says this is useful
(bind-key "M-o" 'other-window)


;; CHORDS
;; key chords
(require 'key-chord)

(key-chord-define-global "JJ" 'switch-to-previous-buffer)
;; (key-chord-define-global "BB" ')
(key-chord-define-global "FF" 'find-file)
(key-chord-define-global "jk" 'beginning-of-buffer)

(key-chord-mode +1)

(provide 'key-bindings)
