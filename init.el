;; No mouse interface. Do this early to avoid momentary flicker.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set up stock dark color theme early in case of downstream errors
(load-theme 'misterioso t)

;; Set up load paths.
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; Keep custom settings in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (not (file-exists-p custom-file))
    (write-region "" nil custom-file))
(load custom-file)

;; Hook for Mac meta key if necessary
(if (file-exists-p (expand-file-name "setup-mac.el" settings-dir))
    (require 'setup-mac))

;; Load global editor settings.
(require 'global-settings)

;; Make sure packages are installed.
(require 'setup-package)

(install-missing-packages
 '(company
   ivy
   swiper
   counsel
   projectile
   zenburn-theme
   solarized-theme
   clojure-mode
   paredit
   markdown-mode
   treemacs
   js2-mode
   yaml-mode
   flycheck
   exec-path-from-shell
   cider
   dockerfile-mode
   lsp-mode
   ivy-xref
   ))

;; other packages I sometimes use
;; nodejs-repl
;; php-mode
;; scala-mode
;; swift-mode
;; dart-mode
;; lsp-dart
;; csharp-mode
;; fuel - major mode for Factor
;; go-mode
;; groovy-mode
;; haskell-mode

;; Load configurations.
(require 'setup-projectile)
(require 'setup-treemacs)
(require 'setup-markdown)
(require 'setup-color-theme)
(require 'setup-exec-path-from-shell)
(require 'setup-paredit)
(require 'setup-flycheck)
(require 'setup-flyspell)
(require 'setup-ivy)
(require 'key-bindings)

;; following is unorganized stuff TODO

;; lsp-mode
(add-hook 'clojure-mode-hook 'lsp)

;; ivy-xref (so that lsp xref, etc., results show in minibuffer)
(setq xref-show-definitions-function #'ivy-xref-show-defs)
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
