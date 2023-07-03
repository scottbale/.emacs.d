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
* Got a message that it was unable to configure [company](https://company-mode.github.io/)

        Unable to autoconfigure company-mode

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
  * `o c` close treemacs
  * `tab` opens/closes node
  * `M n|p` navigates between neighbors
  * `H` collapse parent node
  * `C-c C-p c c` collapse project
* Created `setup-treemacs.el` setting file
  * `C-c t` to invoke `treemacs-select-window`

TIL bookmarks

* `C-x r m` (mnemonic: ReMember) - set a bookmark, give it a name
* `C-x r b` bookmark jump (mnemonic: Recall Bookmark)
* `M-x list-bookmarks` brings up buffer listing bookmarks
  * `m` to mark a bookmark
  * `d` to mark a bookmark for deletion
  * `x` to e.g. delete bookmarks marked for deletion

https://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Conventions.html
https://www.masteringemacs.org/article/mastering-key-bindings-emacs
https://www.braveclojure.com/basic-emacs/
https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html

## 22/10/19

Cider TIL

* [xref](https://metaredux.com/posts/2019/12/11/hard-cider-find-usages.html)
  * `cider-xref-fn-refs-select C-c C-? C-r` known limitations
  * `cider-xref-fn-deps-select C-c C-? C-d`


## 22/10/25

Investigating redoing my emacs config with `use-package`, following example of Sandra Sierra

* [use-package](https://github.com/jwiegley/use-package)
* Sandra Sierra's [emacs config](https://github.com/stuartsierra/dotfiles/tree/bf224ce71ec7e6434293a650449e6c648c4f2a63/.emacs.d)

Interconnectedness of `require`, `provide`, and `load-path`

Use both `melpa` and `melpa-stable` package archives - now `ivy-xref` is available.

Got `ivy-xref` working (see `init.el`) - so lsp xref matches show in minibuffer

How does one decide whether to tweak a setting in normal emacs config or in `custom.el`? For example, `initial-frame-alist`

* In normal config

``` emacs-lisp
(setq initial-frame-alist '((top . 0) (left . 0) (width . 271) (height . 73)))
```

* In `custom.el`

``` emacs-lisp
'(initial-frame-alist '((top . 0) (left . 0) (width . 271) (height . 73)))
```

Redid settings with `use-package` in branch of same name


## 22/10/31

TODO

* mac meta keys can be made conditional
* local config (e.g. frame size) could go in `local.el` rather than `custom.el`, TBD whether needs VC
* always open treemacs window?
* always display line numbers?


## 23/02/20

Should I use this? (Instead of `ivy-xref`?) https://github.com/emacs-lsp/lsp-ivy/


## 23/07/03

Updated emacs packages. Sample from `*Compile-Log*` buffer:

    Compiling file /Users/scott.bale/.emacs.d/elpa/treemacs-20230701.1028/treemacs-annotations.el at Mon Jul  3 11:35:51 2023
    Entering directory ‘/Users/scott.bale/.emacs.d/elpa/treemacs-20230701.1028/’
    treemacs-annotations.el:27:1: Error: Invalid image type ‘svg’

* According to
  [this](https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg),
  this is an issue w/ emacs 28 in MacOS Ventura and fix is coming in emacs 29.
* There's also an [emacs-lsp issue](https://github.com/emacs-lsp/lsp-mode/issues/4054)
* [suggested workaround](https://github.com/Alexander-Miller/treemacs/issues/1017#issuecomment-1515602288)

Now `lsp-mode` won't even start. I get the following error in the status bar:

    file mode specification error: (error Invalid image type 'svg')

Things to try later

* [suggested workaround](https://github.com/Alexander-Miller/treemacs/issues/1017#issuecomment-1515602288)

        (add-to-list 'image-types 'svg)

  worked!
* debug error (toggle emacs enter debug on error)
* Uninstall `treemacs` and `lsp-treemacs`
* Install `librsvg`? https://www.reddit.com/r/emacs/comments/z2kq1d/help_a_newbie_out/ixk4o30/

        brew install emacs-mac --with-librsvg

* Upgrade to emacs 29 (via homebrew? currently emacs is installed via cask `brew info homebrew/cask/emacs`)
  * [bug report](https://debbugs.gnu.org/cgi/bugreport.cgi?bug=59081)
