;;
(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/jsx-mode.el/src")
(add-to-list 'load-path " ~/.emacs.d/elpa/ido-select-window-20131220.1247")
(add-to-list 'load-path "~/.emacs.d/elpa/ido-vertical-mode-20150215.913")
(add-to-list 'load-path "~/.emacs.d/elpa/idomenu-20141123.1320")


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

; Custom shortcuts
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c v") 'previous-multiframe-window)
(global-set-key (kbd "C-c x") 'next-multiframe-window)
(global-set-key (kbd "C-g") 'goto-line)

; clojure cider
; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

; js mode
(setq
      js3-auto-indent-p                           t
      js3-compact                                 t
      js3-consistent-level-indent-inner-bracket   t
      js3-consistent-level-indent-inner-bracket-p nil
      js3-enter-indents-newline                   t
      js3-highlight-level                         3
      js3-include-gears-externs                   nil
      js3-include-rhino-externs                   nil
      js3-indent-level                            2 ;; 4
      js3-indent-on-enter-key                     t
      js3-language-version                        150
      js3-max-columns                             80
      js3-missing-semi-one-line-override          t
      js3-mode-show-parse-errors                  nil
      js3-mode-show-strict-warnings               nil
      js3-pretty-vars                             t
      js3-strict-cond-assign-warning              nil
      js3-strict-missing-semi-warning             nil
      js3-strict-trailing-comma-warning           nil
      js3-strict-var-hides-function-arg-warning   nil
      js3-strict-var-redeclaration-warning        nil
)
; jshint
(setq flycheck-jshintrc ".jshintrc")

; IDO mode for python
(require 'ido)
(ido-mode t)

; python autocompletion
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

; delete traling whitespaces


; change js3 indentation based on comment
; setq js3-indent-level 2


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
; (desktop-save-mode 1)

; enable mouse reporting for terminal emulators
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)


; copy to/from OS X Buffer
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
(global-set-key (kbd "C-c m") 'helm-mini)

(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-variables
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t))


; FLEX
(setq auto-mode-alist (append (list
 '("\.as\'" . actionscript-mode)
 '("\.\(xml\|xsl\|rng\|xhtml\|mxml\)\'" . nxml-mode)
 ;; add more modes here
 ) auto-mode-alist))

;;
;; ------------------ Magic for XML Mode ----------------
;;

(setq nxml-mode-hook
    '(lambda ()
 (setq tab-width        2
       indent-tabs-mode nil)
       (set-variable 'nxml-child-indent     2)
       (set-variable 'nxml-attribute-indent 2)
       )
)

;; JSX
(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-20140709.1227/")
(add-to-list 'load-path "~/.emacs.d/elpa/s-20140620.1657/")
(add-to-list 'load-path "~/.emacs.d/elpa/f-20140220.21/")

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(require 'flycheck)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (equal web-mode-content-type "jsx")
	      ;; enable flycheck
	      (flycheck-select-checker 'jsxhint-checker)
	                    (flycheck-mode))))

(add-hook 'jsx-mode-hook
	  (lambda () (auto-complete-mode 1)))
(setq jsx-indent-level 2)

(require 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

(global-set-key (kbd "C-x o") 'ido-select-window)
(require 'ido-vertical-mode)
(ido-mode 1)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)
(ido-vertical-mode 1)

; Keep temp files separately
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;
(put 'downcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; E.g. add the next line to the start of the js-file:
;; // EMACS js3-indent-level:4
;; and it will change the settings for the indentation
(add-hook
 'js3-mode-hook
 (lambda()
   (interactive)
   (let* ((read-length (if (> (buffer-size) 512)
			   512
			 buffer-size))
	  (buff (buffer-substring 1 read-length))
	  (match-position (string-match "[Ee][Mm][Aa][Cc][Ss]" buff)))
     (if match-position
	 (mapcar
	  (lambda (e)
	    (if
		(string-match "js3-[A-Za-z0-9\-]+\:[A-Za-z0-9]+" e)
		(let* ((pair (split-string e ":"))
		       (var (first pair))
		       (val (second pair))
		       (expr (concatenate 'string "(setq " var " " val ")")))
		  (eval (first (read-from-string expr))))
	      nil))
	  (split-string buff))
              "No custom Emacs configuration found"))))
;;;
