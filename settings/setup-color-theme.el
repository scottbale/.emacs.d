;; use solarized dark in windows, zenburn in terminal (solarized doesn't look right in terminal)
(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'zenburn t))

(provide 'setup-color-theme)
