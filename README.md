EMACS
=====

This is my Gnu Emacs config. It used to reside in my `dotfiles` repo but I extracted it to its own
repo after I realized my config didn't vary by OS except for changing the meta keys for macOS.

Inspired by [rcdickerson](https://github.com/rcdickerson/.emacs.d).

macOS config is enabled by default. Prior to starting Emacs, `settings/setup-mac.el` can be safely
deleted and initialization will continue without it.

Install Emacs
-------------

On macOS Big Sur, using Homebrew, I did

    brew install --cask emacs

For Ubuntu, I did

    apt-get install -y emacs25

Packages
--------

### General

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

### Specialized

* [lsp-mode](https://github.com/emacs-lsp/lsp-mode) - Language Server Protocol Support for Emacs
  * [lsp-treemacs](https://github.com/emacs-lsp/lsp-treemacs)
