;; Package settings
(require 'package)

(use-package powerline
  :if window-system
  :config (setq-default powerline-default-separator 'nil))
(use-package spaceline-all-the-icons :after spaceline :load-path "settings/spaceline-all-the-icons")
(use-package spaceline :after powerline :ensure t
  :config (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))
(use-package fancy-battery :after spaceline :defer 10
  :config (fancy-battery-mode))


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

;; (require 'powerline)
;; (require 'spaceline)
;; (require 'spaceline-all-the-icons)
(require 'sane-defaults)
(require 'gui)
(require 'key-bindings)
(require 'defuns)





;; (use-package spaceline-colors :after spaceline-custom :load-path "init/spaceline-colors"
  ;; :init (add-hook 'after-init-hook 'spaceline-update-faces)
  ;; :config (advice-add 'load-theme :after 'spaceline-update-faces))



;; adjust opacity
(set-frame-parameter (selected-frame) 'alpha '(100 90))
(add-to-list 'default-frame-alist '(alpha 100 90))

;; highlight line
(global-hl-line-mode 1)



;; Font
;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :height 120
;;                     :weight 'normal
;;                     :width 'normal)
