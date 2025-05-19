;; No mouse interface. Do this early to avoid momentary flicker.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set up stock theme early in case of downstream errors
;; (load-theme 'misterioso t)     ;; dark
;; (load-theme 'modus-vivendi t)  ;; dark
(load-theme 'modus-operandi t) ;; light

;; make font bigger
(set-face-attribute 'default nil :height 150)
;; maximize window frame
(setq initial-frame-alist '((fullscreen . maximized)))

;; Keep custom settings in a separate file.
;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))
(if (not (file-exists-p custom-file))
    (write-region "" nil custom-file))
(load custom-file)

;;; settings

;; No splash screen.
(setq inhibit-startup-message t)

;; TLS
(custom-set-variables
 '(gnutls-algorithm-priority "normal:-vers-tls1.3"))

;; Spaces over tabs. Tab width should default to two.
(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)

;; Display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-unix-mode-hook 'display-line-numbers-mode)
(add-hook 'gfm-mode-hook 'display-line-numbers-mode)

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

;; no auto-fill-mode ever
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; store backups in .emacs.d/ subfolder
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; keybindings I got used to from technomancy starter kit
(recentf-mode t)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;; MacOS

;; Mac meta keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Mimic native macOX toggling between windows of same app
(global-set-key (kbd "M-`") 'ns-next-frame)

;; Use conf-mode for GitHub CODEOWNERS file
(add-to-list 'auto-mode-alist '("/CODEOWNERS" . conf-mode))

;;; use-package initialization
(when (version< emacs-version "29")
  (error "Emacs version 29+ required for use-package"))

(require 'package)

;; Don't append `-hook` to hook function names in `:hook`
;; (setq use-package-hook-name-suffix nil)

;;; additional ELPA package archives

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

;;; packages

(use-package solarized-theme
  ;; :defer 2
  :if window-system
  :ensure t
  :pin melpa-stable
  :config (load-theme 'solarized-light t))

(use-package company :defer t :ensure t :pin melpa-stable)

(use-package markdown-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :mode ("\\.md\\'" . gfm-mode))

(use-package ivy
  :defer t
  :ensure t
  :pin melpa-stable
  :bind ("C-x b" . ivy-switch-buffer)
  :config (ivy-mode 1))

(use-package swiper ;; same repo as ivy
  :defer t
  :ensure t
  :pin melpa-stable
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package counsel ;; same repo as ivy
  :defer t
  :ensure t
  :pin melpa-stable
  :bind (("C-x f" . counsel-recentf)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c j" . counsel-git-grep)))

(use-package ivy-xref
  :defer t
  :ensure t
  :pin melpa
  :init
  (setq xref-show-definitions-function #'ivy-xref-show-defs)
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package projectile
  :defer t
  :ensure t
  :pin melpa-stable
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/.emacs.d/" ("~/dev/nu/" . 1) ("~/dev/" . 1) ("~/dev/repo/" . 1)))
  (projectile-mode 1))

(use-package dumb-jump
  :defer t
  :ensure t
  :pin melpa-stable
  ;; Can't do :hook here because `xref-backend-functions` doesn't end with `-hook` suffix
  ;; :hook (xref-backend-functions . dumb-jump-xref-activate)
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  :config
  ;; (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  ;; `git grep` won't work https://github.com/jacktasia/dumb-jump/issues/428
  (setq dumb-jump-force-searcher 'grep))

(use-package treemacs
  :defer t
  :ensure t
  :pin melpa-stable
  :commands (treemacs)
  :bind ("C-c t" . treemacs-select-window)
  :config
  (setq treemacs-is-never-other-window t)
  (treemacs-project-follow-mode t))

(use-package treemacs-projectile
  :defer t
  :ensure t
  :pin melpa-stable)

;;;; for homebrew
(use-package exec-path-from-shell
  :defer 2
  :if (memq window-system '(mac ns x))
  :ensure t
  :pin melpa-stable
  ;; :init (setq exec-path (append exec-path '("/opt/homebrew/bin")))
  :config (exec-path-from-shell-initialize))

(use-package clojure-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :mode "\\.repl\\'"
  :interpreter "bb"
  ;; :hook ((clojure-mode . subword-mode)
  ;;        (clojure-mode . hs-minor-mode)
  ;;        (clojure-mode . eldoc-mode)
  ;;        (clojure-mode . flycheck-mode))
  ;; :config
  ;; (require 'paredit)
  )

(use-package cider
  :defer t
  :ensure t
  :pin melpa-stable
  :bind ("C-x M-e" . cider-pprint-eval-last-sexp-to-repl)
  ;; A list of aliases to include when using the clojure cli.
  :config (setq cider-clojure-cli-aliases ":dev:test"))

(use-package paredit
  :defer t
  :ensure t
  :pin melpa-stable
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode))
  ;; conflicts with `xref-find-reference`, and I never use
  ;; `paredit-convolute-sexp`
  :config (unbind-key "M-?" paredit-mode-map))

(use-package lsp-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :bind-keymap ("C-c l" . lsp-command-map)
  :init (setq lsp-enable-indentation nil)
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 500)
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(use-package lsp-ui
  :defer t
  :ensure t
  :pin melpa-stable
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :defer t
  :ensure t
  :pin melpa-stable
  :hook (lsp-treemacs-after-jump . (lambda () (kill-buffer lsp-treemacs-symbols-buffer-name)))
  :bind (:map lsp-command-map
              ("g s" . lsp-treemacs-symbols)
              ("g S" . lsp-treemacs-symbols-goto-symbol)
              ("g c" . lsp-treemacs-call-hierarchy)))

(use-package lsp-ivy
  :defer t
  :ensure t
  :pin melpa-stable)

(use-package flycheck
  :defer t
  :ensure t
  ;; Need latest version from MELPA for LSP
  :pin melpa
  :config (global-flycheck-mode))

(use-package js2-mode :defer t :ensure t :pin melpa-stable)
(use-package yaml-mode :defer t :ensure t :pin melpa-stable)
(use-package dockerfile-mode :defer t :ensure t :pin melpa-stable)

(use-package plantuml-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :init
  (setq plantuml-jar-path "/opt/homebrew/Cellar/plantuml/1.2024.8/libexec/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-java-args '("-Djava.awt.headless=true" "-jar")))

(provide 'init)
;;; init.el ends here
