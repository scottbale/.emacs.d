Handy emacs/cider/clj commands
==============================

XREF commands
-------------

cider, clojure-lsp, dumb-jump and other modes provide xref backends, see hook|variable
`xref-backend-functions`.

`M-.` - `xref-find-definitions`
`M-?` - `xref-find-references`
`M-,` - `xref-go-back`
`C-M-,` - `xref-go-forward`
`C-M-.` - `xref-find-apropros`


CIDER commands
--------------

`C-c C-t p` - Cider run project tests
`C-c C-t n` - Cider run namespace tests
`C-c C-t t` - Cider run test (at point)
`C-c C-t b` - Cider test - show report buffer
`C-c C-t a` - Cider rerun test
`C-c C-z` - Cider switch to repl buffer (only from clj ns buffer)
`C-c C-z` - Cider switch to last clj buffer (from repl buffer)
`C-c M-n n` - Cider repl switch namespace
`C-c M-n f` - Cider find namespace (only finds loaded namespaces)
`C-c RET` - Cider macroexpand-1
`C-c M-m` - Cider macroexpand-all
`C-x C-e` - cider-eval-last-sexp (prefix outputs to current buffer)
`C-c M-e` - cider-eval-last-sexp-to-repl (prefix switches to repl)
`C-x M-e` - cider-pprint-eval-last-sexp-to-repl (prefix switches to repl)

LSP commands
------------

(prefixed by `C-c l`)

`g r` - lsp-find-references (or simply xref `M-?`)
`G r` - lsp-ui-peek-find-find-references
`g g` - lsp-find-definition (or simply xref `M-.`)
`G g` - lsp-ui-peek-find-definitions
`g s` - lsp-treemacs-symbols
`g S` - lsp-treemacs-symbols-goto-symbol
`r r` - lsp-rename

`M-x lsp-clojure-server-log`

VC (version control) mode
-------------------------

`C-x v d` - vc-dir (status)
`C-x v D` - vc-root-diff
`C-x v =` - vc-diff
`C-x v g` - vc-annotate (blame)
`C-x v b s` - vc-switch-branch
`C-x v b c` - vc-create-branch
`C-x v +` - vc-update (pull)
`C-c j` - counsel-git-grep (`counsel-grep`, `counsel-rg`, and `counsel-fzf` also exist)
