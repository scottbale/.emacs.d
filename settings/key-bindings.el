;; keybindings I got used to from technomancy starter kit
(recentf-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(provide 'key-bindings)
