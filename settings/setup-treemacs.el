;; always sync treemacs pane with current projectile project
(treemacs-project-follow-mode)

;; Don't let `other-window` command give focus to treemacs
(setq treemacs-is-never-other-window t)

(global-set-key (kbd "C-c t") 'treemacs-select-window)

(provide 'setup-treemacs)
