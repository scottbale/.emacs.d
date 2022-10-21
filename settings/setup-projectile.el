(projectile-global-mode +1)
(setq projectile-completion-system 'ivy)
(setq projectile-project-search-path '("~/.emacs.d/" ("~/dev/nu/" . 1) ("~/dev/" . 1) ("~/dev/clojure/" . 1)))
;; (global-set-key (kbd "C-S-n") 'projectile-discover-projects-in-directory)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'setup-projectile)
