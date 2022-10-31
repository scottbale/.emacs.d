;;; https://github.com/stuartsierra/dotfiles/blob/bf224ce71ec7e6434293a650449e6c648c4f2a63/.emacs.d/bootstrap.el

;;; bootstrap.el

;; Load this file once (`M-x eval-buffer`), in a fresh Emacs configuration,
;; to install the minimal dependencies for the rest of this configuration. 

;;; Install use-package

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-refresh-contents)

(package-install 'use-package)
