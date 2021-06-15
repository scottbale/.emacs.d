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
