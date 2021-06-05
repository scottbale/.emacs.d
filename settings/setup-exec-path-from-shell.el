;; for homebrew
(setq exec-path (append exec-path '("/usr/local/bin")))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
(exec-path-from-shell-initialize)

(provide 'setup-exec-path-from-shell)
