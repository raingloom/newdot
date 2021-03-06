;; From https://emacs-doctor.com/emacs-strip-tease.html
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(add-to-list 'load-path "~/.emacs.d/local/i3-emacs")

(require 'i3)
(require 'i3-integration)
(i3-one-window-per-frame-mode-on)
(i3-advise-visible-frame-list-on)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(setq racer-cargo-home "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "xdg-open")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open"))))
 '(custom-safe-themes
   (quote
    ("a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (latex-unicode-math-mode cmake-mode skewer-reload-stylesheets skewer-mode drag-stuff paredit-everywhere scss-mode web-mode flymake-rust auctex latex-preview-pane markdown-mode solarized-theme zenburn-theme lua-mode markdown-mode+ cargo flycheck-rust company racer rust-mode))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(setq gud-pdb-command-name "python -m pdb")
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(setq org-log-done t)
(setq org-log-done-with-time t)

(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(drag-stuff-global-mode)
(drag-stuff-define-keys)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
