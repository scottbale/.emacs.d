(projectile-global-mode +1)
(setq projectile-completion-system 'ivy)
;; (global-set-key (kbd "C-S-n") 'projectile-discover-projects-in-directory)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'setup-projectile)
