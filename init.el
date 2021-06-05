;; No mouse interface. Do this early to avoid momentary flicker.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; TLS
(custom-set-variables
 '(gnutls-algorithm-priority "normal:-vers-tls1.3"))

;; Set up stock dark color theme early in case of downstream errors
(load-theme 'misterioso t)

;; OS X meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; No splash screen.
(setq inhibit-startup-message t)

;; Set up load paths.
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; Keep custom settings in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (not (file-exists-p custom-file))
    (write-region "" nil custom-file))
(load custom-file)

;; Load global editor settings.
(require 'global-settings)

;; Make sure packages are installed.
(setq package-enable-at-startup nil)
;; -----work around gnu package archive
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (setq package-check-signature nil)
(package-initialize)
(require 'setup-package)

(install-missing-packages
 '(ivy
   better-defaults
   idle-highlight-mode
   swiper
   counsel
   projectile
   zenburn-theme
   solarized-theme
   clojure-mode
   paredit
   haskell-mode
   markdown-mode
   js2-mode
   php-mode
   yaml-mode
   groovy-mode
   flycheck
   exec-path-from-shell
   cider
   go-mode
   dockerfile-mode
   ))

;; Load configurations.
(require 'setup-projectile)
(require 'setup-markdown)
(require 'setup-color-theme)
(require 'setup-exec-path-from-shell)
(require 'setup-paredit)
(require 'setup-flycheck)
(require 'setup-flyspell)
(require 'setup-ivy)
(require 'key-bindings)
