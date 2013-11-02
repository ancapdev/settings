;; Color theme
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-comidia)))

;; Remove menubar and toolbar
(menu-bar-mode -1)
; (tool-bar-mode -1)

;; Always use spaces in place of tabs
(setq-default indent-tabs-mode nil)
; (highlight-tabs)
; (highlight-trailing-whitespace)

;; C/C++ indentation
(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'c-mode-common-hook  'my-c-mode-hook)

;; CMake mode
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp")
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; Stop windows splitting
(setq split-height-threshold nil)
(setq split-width-threshold nil)
