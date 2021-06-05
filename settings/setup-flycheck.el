;; turn on flycheck for js2-mode
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

(provide 'setup-flycheck)
