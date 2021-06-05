(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp--mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(provide 'setup-paredit)
