;; Spaces over tabs. Tab width should default to two.
(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)

;; Replace selected text on new text entry.
(pending-delete-mode t)

;; No double spaces at end of sentences.
(set-default 'sentence-end-double-space nil)

;; Use 100 chars as default line width.
(set-default 'fill-column 100)

;; Always show line and column numbers.
(setq line-number-mode t)
(setq column-number-mode t)

;; Show me empty lines after buffer end.
(set-default 'indicate-empty-lines t)

;; Transparently open compressed files.
(auto-compression-mode t)

;; Auto refresh buffers.
(global-auto-revert-mode 1)

;; Automatically clean up unused buffers every once in a while.
(require 'midnight)

;; Also auto refresh dired, but be quiet about it.
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Confirm with 'y' / 'n' instead of 'yes' / 'no'.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't ring any bells.
(setq ring-bell-function 'ignore)

;; Highlight find/replace results.
(setq query-replace-highlight t)

;; UTF-8, please.
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; We probably have plenty of memory to allocate.
;; (setq gc-cons-threshold 20000000)

;; No electric indent.
(setq electric-indent-mode nil)

;; Offer to create parent directories if they do not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
;; (defun my-create-non-existent-directory ()
;;   (let ((parent-directory (file-name-directory buffer-file-name)))
;;     (when (and (not (file-exists-p parent-directory))
;;                (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
;;       (make-directory parent-directory t))))
;; (add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)

;; no auto-fill-mode ever
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(provide 'global-settings)
