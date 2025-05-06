EMACS
=====

This is my Gnu Emacs config. It used to reside in my `dotfiles` repo but I extracted it to its own
repo after I realized my config didn't vary by OS except for changing the meta keys for macOS.

Uses [use-package](https://github.com/jwiegley/use-package), following example of [Sandra Sierra](https://github.com/stuartsierra/dotfiles/tree/bf224ce71ec7e6434293a650449e6c648c4f2a63/.emacs.d)

macOS config is enabled by default.

Install Emacs
-------------

On macOS Big Sur, using Homebrew, I did

    brew install --cask emacs

For Ubuntu, I did

    apt-get install -y emacs25

Packages
--------

Some links and notes (mostly to self) about the packages I mainly use.

* [counsel](https://github.com/abo-abo/swiper) - collection of Ivy-enhanced versions of common Emacs commands.
* [dash](https://github.com/magnars/dash.el) - A modern list library for Emacs
* [ivy](https://github.com/abo-abo/swiper) - generic completion mechanism for Emacs.
  * replaces [Helm](https://github.com/emacs-helm/helm), Ido
* [flycheck](http://www.flycheck.org) - Minor mode for on-the-fly syntax checking.
* [projectile](https://github.com/bbatsov/projectile) - project identification and interaction
* paredit - minor mode for editing parentheses
* [swiper](https://github.com/abo-abo/swiper) - an Ivy-enhanced alternative to Isearch.
* [treemacs](https://github.com/Alexander-Miller/treemacs) - a tree layout file explorer for Emacs
  * [treemacs-projectile](https://github.com/Alexander-Miller/treemacs)
* [lsp-mode](https://github.com/emacs-lsp/lsp-mode) - Language Server Protocol Support for Emacs
  * [lsp-treemacs](https://github.com/emacs-lsp/lsp-treemacs)
* [cider](https://github.com/clojure-emacs/cider)
