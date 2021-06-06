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

