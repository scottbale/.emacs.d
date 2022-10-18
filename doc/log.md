Emacs Log
=========

> a sure way to destroy an emacs user's productivity is to suggest that what they want to do is not possible with emacs

- [puredanger](https://twitter.com/puredanger/status/21066226956)


## 22/7/4


### Periodic emacs fresh install

* review what is actually installed (`M-s package-list-packages-no-refresh`)
  * If need be, update `install-missing-packages` section of `init.el`
* delete or backup `elpa/` dir, `custom.el`, whatever else is in `.gitignore`
* bounce emacs

`better-defaults`, `idle-highlight-mode` no longer available in melpa


### Unused Dart/Flutter stuff

``` emacs-lisp
;; init.el
;; temp TODO move to permanent home Dart/Flutter/DAP/LSP WIP
(add-hook 'dart-mode-hook 'lsp)
(setq dap-utils-extension-path "/path/to/home/dir/.dap/extension")
;; lsp-dart-dap-debugger-path|program

;; setup-projectile.el
(add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
```

requires [dap-mode](https://github.com/emacs-lsp/dap-mode) - Debug Adapter Protocol

### Dorking around with installing LSP for Clojure


* lsp-mode 7.0.1 obsolete

Is Treemacs necessary?

Install Clojure LSP [via LSP mode](https://emacs-lsp.github.io/lsp-mode/tutorials/clojure-guide/#via-lsp-mode) didn't work - download kept timing out

Installed clojure LSP [via homebrew](https://github.com/clojure-lsp/clojure-lsp/blob/master/docs/installation.md#homebrew-macos-and-linux). Then set the following:

``` emacs-lisp
(setq lsp-clojure-custom-server-command '("bash" "-c" "/usr/local/Cellar/clojure-lsp-native/2022.06.29-19.32.13/bin/clojure-lsp"))
```

How can I see if Clojure-LSP process was launched? TIL

* `M-x proced` for process
* `M-x list-processes` to see processes spawned by emacs
* `M-x list-system-processes`

Trying by starting `clojure-lsp` manually from root of a project:

``` clojure
clojure-lsp listen --verbose
```

And now trying to do Emacs LSP things with a .clj file opened from that project.

Okay ignore all of the preceding.

* I've now installed the latest Emacs `lsp-mode` package from melpa unstable.
* I opened a sample namespace in a Clojure project
* I interactively invoked `lsp` with prefix, `C-u M-x lsp`, which then prompted me to choose a specific language server, and `clojure-lsp` was one choice.
* Prompted me to choose project root, gave me multiple choices (I choice first option)
* Got a message that it was unable to configure `company`
* Questions
  * How do I get emacs to automatically enable lsp-mode for a Clojure buffer
  * Will it reuse the same running lsp process for that project? Looks like yes (when I manually `lsp` in a buffer in the same project)
  * How are on-disk projects delineated? Projectile integration?

Stuff going in `~/.cache/`


## 22/10/17

updated a bunch of emacs packages


## 22/10/18

[treemacs](https://github.com/Alexander-Miller/treemacs) looks promising!

* `M-x treemacs` to open
* `M-x treemacs-project-follow-mode`
* `C-x 0` while on treemacs pane closes it but `C-x 1` on any other pane leaves it open
* keybindings while in treemacs pane:
  * `?` "summon helpful hydra"
  * `o c` close treemacs (while in pane)
  * `tab` opens/closes folder
  * `M n|p` navigates between neighbors
* TBD
  * What would be a good keybinding to open (and/or navigate to) treemacs pane?

Sandra Sierra's [emacs config](https://github.com/stuartsierra/dotfiles/tree/bf224ce71ec7e6434293a650449e6c648c4f2a63/.emacs.d)
