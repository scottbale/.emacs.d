;; No mouse interface. Do this early to avoid momentary flicker.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set up stock theme early in case of downstream errors
;; (load-theme 'misterioso t)     ;; dark
;; (load-theme 'modus-vivendi t)  ;; dark
(load-theme 'modus-operandi t) ;; light

;; make font bigger
(set-face-attribute 'default nil :height 170)
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

;; Use 80 chars as default line width.
(set-default 'fill-column 80)

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
;; (global-set-key (kbd "C-c r") 'revert-buffer)
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
;; https://github.com/jwiegley/use-package
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

;; http://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  ;; :defer 2
  :if window-system
  :ensure t
  :pin melpa-stable
  :config (load-theme 'solarized-light t))

;; https://github.com/company-mode/company-mode
(use-package company
  :ensure t
  :pin melpa-stable
  :hook (prog-mode . company-mode)
  :custom
  (company-idle-delay 0.15)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t)
  (company-tooltip-align-annotations t))

;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :mode ("\\.md\\'" . gfm-mode))

;; https://github.com/abo-abo/swiper
(use-package ivy
  :ensure t
  :pin melpa-stable
  :bind ("C-x b" . ivy-switch-buffer)
  :config (ivy-mode 1))

;; https://github.com/abo-abo/swiper
(use-package swiper
  :ensure t
  :pin melpa-stable
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

;; https://github.com/abo-abo/swiper
(use-package counsel
  :ensure t
  :pin melpa-stable
  :bind (("C-x f" . counsel-recentf)
         :map counsel-mode-map
         :prefix-map counsel-prefix-map
         :prefix "C-c c"
         ("g" . counsel-git-grep)
         ("r" . counsel-rg)
         ("f" . counsel-fzf))
  :config (counsel-mode 1))

;; https://github.com/alexmurray/ivy-xref
(use-package ivy-xref
  :defer t
  :ensure t
  :pin melpa
  :init
  (setq xref-show-definitions-function #'ivy-xref-show-defs)
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;; Built-in project.el
(use-package project
  :config
  ;; Exclude home directory from being treated as a project
  (defun my/project-ignore-home-directory (dir)
    "Prevent home directory from being treated as a project."
    (when (string-equal (expand-file-name dir) (expand-file-name "~/"))
      nil))

  ;; Add our ignore function to the beginning of project detection
  (add-hook 'project-find-functions #'my/project-ignore-home-directory -100)

  ;; Support .dir-locals.el as project markers for non-VC projects
  (when (version<= "29" emacs-version)
    (add-to-list 'project-vc-extra-root-markers ".dir-locals.el"))

  ;; Auto-discover projects in specified directories (non-recursive for speed)
  ;; See also: `project-list-file` variable, which is the location where list of
  ;; known projects are saved
  (project-remember-projects-under "~/.emacs.d/" nil)
  (project-remember-projects-under "~/dev/repo/" nil)
  ;; (project-remember-projects-under "~/dev/scratch/projects/" nil)
  )

;; https://github.com/jacktasia/dumb-jump
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
  (setq dumb-jump-force-searcher 'rg))

;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :defer t
  :ensure t
  :pin melpa-stable
  :commands (treemacs)
  :bind ("C-c t" . treemacs-select-window)
  :config
  (setq treemacs-is-never-other-window t)
  (treemacs-project-follow-mode t))

;;;; for homebrew
;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :defer 2
  :if (memq window-system '(mac ns x))
  :ensure t
  :pin melpa-stable
  ;; :init (setq exec-path (append exec-path '("/opt/homebrew/bin")))
  :config (exec-path-from-shell-initialize))

;; https://github.com/clojure-emacs/clojure-mode
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

;; https://github.com/clojure-emacs/cider
(use-package cider
  :defer t
  :ensure t
  :pin melpa-stable
  :bind ("C-x M-e" . cider-pprint-eval-last-sexp-to-repl)
  ;; A list of aliases to include when using the clojure cli.
  :config (setq cider-clojure-cli-aliases ":dev:test"))

;; https://paredit.org
(use-package paredit
  :defer t
  :ensure t
  :pin melpa-stable
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode))
  ;; conflicts with `xref-find-reference`, and I never use
  ;; `paredit-convolute-sexp`
  :config (unbind-key "M-?" paredit-mode-map))

;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         (edn-mode . lsp))
  :bind-keymap ("C-c l" . lsp-command-map)
  :init (setq lsp-enable-indentation nil)
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 500)
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode
               edn-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

;; https://github.com/emacs-lsp/lsp-ui
(use-package lsp-ui
  :defer t
  :ensure t
  :pin melpa-stable
  :commands lsp-ui-mode)

;; https://github.com/emacs-lsp/lsp-treemacs
(use-package lsp-treemacs
  :defer t
  :ensure t
  :pin melpa-stable
  :hook (lsp-treemacs-after-jump . (lambda () (kill-buffer lsp-treemacs-symbols-buffer-name)))
  :bind (:map lsp-command-map
              ("g s" . lsp-treemacs-symbols)
              ("g S" . lsp-treemacs-symbols-goto-symbol)
              ("g c" . lsp-treemacs-call-hierarchy)))

;; https://github.com/emacs-lsp/lsp-ivy
(use-package lsp-ivy
  :defer t
  :ensure t
  :pin melpa-stable)

;; https://github.com/flycheck/flycheck
(use-package flycheck
  :defer t
  :ensure t
  ;; Need latest version from MELPA for LSP
  :pin melpa
  :config (global-flycheck-mode))

;; https://github.com/skuro/plantuml-mode
(use-package plantuml-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :init
  (setq plantuml-jar-path "/opt/homebrew/Cellar/plantuml/1.2024.8/libexec/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-java-args '("-Djava.awt.headless=true" "-jar")))

;; https://github.com/editor-code-assistant/eca-emacs
(use-package eca
  :defer t
  :ensure t
  :pin melpa
  ;;:config
  ;;(setq eca-server-install-path "/Users/scott.bale/.emacs.d/eca")
  ;;(setq eca-custom-command '("java" "-jar" "/Users/scott.bale/Downloads/eca.jar" "server"))
  )

;; various programming languages etc major modes
(use-package yaml-mode         :defer t :ensure t :pin melpa-stable)
(use-package dockerfile-mode   :defer t :ensure t :pin melpa-stable)
(use-package js2-mode          :defer t :ensure t :pin melpa-stable)
(use-package typescript-mode   :defer t :ensure t :pin melpa-stable)
(use-package kotlin-mode       :defer t :ensure t :pin melpa)
(use-package go-mode           :defer t :ensure t :pin melpa-stable)
(use-package elixir-mode       :defer t :ensure t :pin melpa-stable)
(use-package haskell-mode      :defer t :ensure t :pin melpa-stable)
(use-package scala-mode        :defer t :ensure t :pin melpa-stable)


(provide 'init)
;;; init.el ends here
