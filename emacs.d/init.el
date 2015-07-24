;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jahns emacs dot file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; path for elisp files (e.g. for custom .el files)
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; osx keybindings (swap option and cmd)
;(setq mac-option-modifier 'super)
;(setq mac-command-modifier 'meta)

;; Trash can support
(setq delete-by-moving-to-trash t)

;; save desktops automatically
(desktop-save-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
  Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Activate installed packages
(package-initialize)

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil
                          'evil-surround
                          'evil-commentary
                          'projectile
                          'magit
                          'web-mode
                          'buffer-move
                          'color-theme-sanityinc-tomorrow
                          )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; visual settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; disable menu bar
(if (eq (window-system) nil)
    (menu-bar-mode -1))

;; disable toolbar
(if (not (eq (window-system) nil))
    (tool-bar-mode -1))

;; disable scrollbars
(scroll-bar-mode -1)

;; display current file path in frame title
(setq frame-title-format '((:eval default-directory)))

;; Prevent the annoying beep on errors
(setq ring-bell-function 'ignore)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Modeline info
;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)
;; (display-time-mode 1)
;; (display-battery-mode 1)

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Gotta see matching parens
(show-paren-mode t)

;; do not truncate long lines by default
(setq-default truncate-lines t)

;; display current line and col number in 'status bar'
(line-number-mode 1)
(column-number-mode 1)

;; line numbers on the left of buffer
;;(global-linum-mode 1)

;; use buffer-menue instead of list-buffers
(global-set-key "\C-x\C-b" 'buffer-menu)

;; color theme
(color-theme-sanityinc-tomorrow-eighties)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; editing and movin around
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; map C-x to C-,
(define-key global-map (kbd "C-,") ctl-x-map)

;; configure evil
;;
;; load evil!!!
(evil-mode 1)	;; enable evil-mode
(setq evil-default-cursor t)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; set initial state for certain buffers
;;(evil-set-initial-state 'dired-mode 'emacs)
;;(evil-set-initial-state 'grep-mode 'emacs)
;;(evil-set-initial-state 'nodejs-repl 'emacs)
;;(evil-set-initial-state 'org-mode 'emacs)
;;(evil-set-initial-state 'git-commit-mode 'insert) ;; enter insert mode to edit a commit msg.

;;(require 'evil-surround)
(global-evil-surround-mode 1)


;;
;; smart open line
;; (from emacsredux.com)
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(shift control j)] 'smart-open-line)
;;(global-set-key [(shift return)] 'smart-open-line)  ; eclipse style


;;
;; scrolling the page w/ arrow keys (not moving point)
;;
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 2)))
(global-set-key "\M-n" (lambda () (interactive) (scroll-up 2)))
;; faster scrolling
;(global-set-key [(shift meta p)] (lambda () (interactive) (scroll-down 6)))
;(global-set-key [(shift meta n)] (lambda () (interactive) (scroll-up 6)))
;;(global-set-key [up] (lambda () (interactive) (scroll-down 1)))
;;(global-set-key [down] (lambda () (interactive) (scroll-up 1)))

;;(global-set-key [left] (lambda () (interactive) (scroll-right tab-width t)))
;;(global-set-key [right] (lambda () (interactive) (scroll-left tab-width t)))


;;
;; move between windows and buffers
;;

;; activate windmove (switch frames w/ meta+ arrows and frames w/ super+ arrows.
(windmove-default-keybindings 'meta)

;; buffer-move (swap two buffers)
;(require 'buffer-move)
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)


; enable ido-mode
(ido-mode)
(setq ido-enable-flex-matching t)

;; org mode
(setq org-log-done t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-set-key "\C-x\C-b" 'buffer-menu)
;;(global-set-key "\C-x\C-b" 'ibuffer) ;; bind buffer-menu to C-x C-b instead of list-buffers
;;(setq ibuffer-expert t)
;;(setq ibuffer-saved-filters
      ;;(quote (("haskell"
	       ;;((or (used-mode . haskell-mode)
		    ;;(name . "*Haskell*"))))
	      ;;("java"
	       ;;((or (used-mode . java-mode)
		    ;;(used-mode . jde-mode))))
	      ;;("gnus"
	       ;;((or (mode . message-mode)
		    ;;(mode . mail-mode)
		    ;;(mode . gnus-group-mode)
		    ;;(mode . gnus-summary-mode)
		    ;;(mode . gnus-article-mode))))
	      ;;("erlang"
	       ;;((or (mode . erlang-mode)
		    ;;(name . "*Erlang*"))))
	      ;;("programming"
	       ;;((or (mode . emacs-lisp-mode)
		    ;;(mode . cperl-mode)
		    ;;(mode . c-mode)
		    ;;(mode . java-mode)
		    ;;(mode . idl-mode)
		    ;;(mode . lisp-mode)))))))
;;
;;(setq ibuffer-saved-filter-groups
      ;;(quote (("by-lang"
					;;;("Ruby" (mode . ruby-mode))
					;;;("Scala" (mode . scala-mode))
	       ;;("Haskell" (saved . "haskell"))
	       ;;("SML" (mode . sml-mode))
	       ;;("Scheme" (mode . scheme-mode))
					;;;("Clojure" (mode . clojure-mode))
					;;;("Erlang" (saved . "erlang"))
	       ;;("JavaScript" (mode . js-mode))
	       ;;("Prolog" (mode . prolog-mode)))
	      ;;("web"
	       ;;("html" (or (mode . html-mode)
			   ;;(mode . web-mode)))
	       ;;("css"  (mode . css-mode))
	       ;;("JavaScript" (or (mode . js-mode)
				 ;;(mode . js2-mode))))
	      ;;("fuh"
	       ;;("Scheme" (mode . scheme-mode))
	       ;;("SML" (mode . sml-mode))
	       ;;("Prolog" (mode . prolog-mode)))
	      ;;("default")
	      ;;)))
;;
;;;; startup with filter group
;;(add-hook 'ibuffer-mode-hook
	  ;;(lambda ()
	    ;;(ibuffer-switch-to-saved-filter-groups "web")))
;;
;;;; inflate name column width
;;(setq ibuffer-formats
      ;;'((mark modified read-only " " (name 32 32 :left :elide)
	      ;;" " (size 9 -1 :right)
	      ;;" " (mode 16 16 :left :elide) " " filename-and-process)
	;;(mark " " (name 48 -1) " " filename)))
;;
;;;; use ido mode in ibuffer
;;(defun ibuffer-ido-find-file ()
  ;;"Like `ido-find-file', but default to the directory of the buffer at point."
  ;;(interactive
   ;;(let ((default-directory (let ((buf (ibuffer-current-buffer)))
			      ;;(if (buffer-live-p buf)
				  ;;(with-current-buffer buf
				    ;;default-directory)
				;;default-directory))))
     ;;(ido-find-file-in-dir default-directory))))
;;
;;;;(define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)
;;(add-hook 'ibuffer-mode-hook
          ;;(lambda ()
            ;;(define-key ibuffer-mode-map "\C-x\C-f"
              ;;'ibuffer-ido-find-file)))
;;;; ibuffer end.

;;(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; programming modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; compile command
(global-set-key (kbd "\C-c c") 'compile)
;; default compile command
;;(setq compile-command "ant -emacs -find build.xml ")

;; dont prompt for compile command (for prompt prefix with: C-u)
(setq compilation-read-command nil)
;; automatically close compilation buffer
;;(defun bury-compile-buffer-if-successful (buffer string)
  ;;"Bury a compilation buffer if succeeded without warnings "
  ;;(if (and
       ;;(string-match "compilation" (buffer-name buffer))
       ;;(string-match "finished" string)
       ;;(not
        ;;(with-current-buffer buffer
          ;;(search-forward "warning" nil t))))
      ;;(run-with-timer 1 nil
                      ;;(lambda (buf)
                        ;;(bury-buffer buf)
                        ;;(switch-to-prev-buffer (get-buffer-window buf) 'kill))
                      ;;buffer)))
;;(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)


;;
;; set tab space defaults
;;
;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; tab width
(setq-default tab-width 2)
;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; offset
(setq-default c-basic-offset 2)
(setq js-indent-level 2)	;for javascript
(setq tab-stop-list (number-sequence 2 120 2))


;php mode
;;(load "php-mode")
;;(add-hook 'php-mode-hook
;;      '(lambda ()
;;         (setq indent-tabs-mode t)
;;         (setq tab-width 4)
;;         (setq c-basic-offset 4)))


; haskell mode
;;(load "~/.emacs.d/elisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; sml mode
;(add-to-list 'load-path "/Users/jahn/.emacs.d/elisp/sml-mode")
;(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
;(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)

;; racket (through geiser)
;;(setq geiser-racket-binary "/Applications/Racket\ v5.3.5/bin/racket")
;; scheme ocb scheme (STk Scheme)
;;(setq scheme-program-name "/Applications/Racket\ v5.3.5/bin/mzscheme")(setq geiser-active-implementations '(racket))

;;
;; sicstus prolog
;;(load "/usr/local/sicstus4.0.8/lib/sicstus-4.0.8/emacs/sicstus_emacs_init")
;;(global-font-lock-mode t)       ; GNU Emacs
;;(setq font-lock-maximum-decoration t)
;;(add-hook 'prolog-mode-hook 'turn-on-font-lock)


; google go mode
;;(require 'go-mode-load)

;; slime mode
;; (setq inferior-lisp-program "/Applications/Racket_v5.3/bin/mzscheme") ; your Lisp system
;; (add-to-list 'load-path "~/.emacs.d/elisp/slime") ; your SLIME directory
;; (require 'slime)
;; (slime-setup)

;; scala
;;(add-to-list 'load-path "~/.emacs.d/elisp/scala-mode")
;;(require 'scala-mode-auto)

;; clojure mode
;;(add-to-list 'load-path "~/.emacs.d/elisp/clojure-mode")
;;(require 'clojure-mode)

;; ;; setup erlang mode
;; ;; add the location of the elisp files to the load-path
;; (setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.5/emacs"
         ;; load-path))
;; ;; set the location of the man page hierarchy
;; (setq erlang-root-dir "/usr/local/lib/erlang")
;; ;; add the home of the erlang binaries to the exec-path
;; (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;; ;; load and eval the erlang-start package to set up
;; ;; everything else
;; (require 'erlang-start)

;; nodejs mode
;;(require 'nodejs-mode)

;; cedet
;; (load-file "~/.emacs.d/elisp/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ;; jdee (new version as of May 2013)
;; (setq jde-help-remote-file-exists-function '("beanshell")) ;; avoid no wget error message.
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/jdee-2.4.1/lisp"))
;; (require 'jde)

;; jdee (old config)
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/elib"))


;; ecb
;;(add-to-list 'load-path "~/.emacs.d/elisp/ecb")
;;(require 'ecb)


;; web mode (http://web-mode.org)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (setq web-mode-indent-style 2)
)
(add-hook 'web-mode-hook  'web-mode-hook)

;;
;; magit
;;
(global-set-key (kbd "C-x g") 'magit-status)

