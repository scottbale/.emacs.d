(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(provide 'setup-markdown)
