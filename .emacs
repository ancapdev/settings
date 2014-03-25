;; .emacs

(add-to-list 'load-path "~/elisp/")

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)


;; Color theme
(add-to-list 'load-path "~/elisp/color-theme-6.6.0")
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
  (c-set-offset 'arglist-intro 4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'c-mode-common-hook  'my-c-mode-hook)

;; CMake mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
	("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))

;; Stop windows splitting
(setq split-height-threshold nil)
(setq split-width-threshold nil)
(put 'upcase-region 'disabled nil)


;; Backup settings
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq auto-save-file-name-transforms
      `((".*" , "~/.saves" t)))