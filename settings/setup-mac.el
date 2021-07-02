;; Mac meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Mimic native macOX toggling between windows of same app
(global-set-key (kbd "M-`") 'ns-next-frame)

(provide 'setup-mac)
