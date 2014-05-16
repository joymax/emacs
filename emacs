(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
    (concat dired-omit-files "\\|^\\..+$\\|\\.pdf$\\|\\.pyc$"))
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c v") 'previous-multiframe-window)
(global-set-key (kbd "C-c x") 'next-multiframe-window)

; IDO mode for python
(require 'ido)
(ido-mode t)

; python autocompletion
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Frame navigation alt + [arrow keys]
(windmove-default-keybindings 'meta)

;; Show the column and line numbers
(setq line-number-mode t)
(setq column-number-mode t)

; Clojure settings
(add-to-list 'load-path "~/emacs.d/vendor")
(require 'cider)

; yanippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet)
(yas-global-mode 1)

; nlinum - show line numbers
; (setq width (max width (+ (length str) 1)))
(add-to-list 'load-path "~/.emacs.d/elpa/nlinum-1.3")
(require 'nlinum)
(global-nlinum-mode 1)
(setq nlinum-format "%d ")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "color-29" :foreground "brightwhite")))))

; save window state
(desktop-save-mode 1)
