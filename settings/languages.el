(use-package elixir-mode)
(use-package alchemist)


;; Manually added
(require 'prettier-js)
(add-hook 'js-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'prettier-before-save)))




(provide 'languages)
