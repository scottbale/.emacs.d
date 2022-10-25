(require 'package)
(require 'cl-macs)

;; (setq package-enable-at-startup nil)
;; -----work around gnu package archive
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (setq package-check-signature nil)
;; (package-initialize)


(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("stable-melpa" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-unstable" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

(package-initialize)

(defun install-missing-packages (packages)
  (condition-case nil
      (packages-install packages)
    (error
     (package-refresh-contents)
     (packages-install packages))))

(defun packages-install (packages)
  (cl-loop for p in packages
    when (not (package-installed-p p))
      do (package-install p))
  (delete-other-windows))

(provide 'setup-package)
