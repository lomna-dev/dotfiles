;; Set default encoding for files
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
;; do this especially on Windows, else python output problem
(set-terminal-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Basic Changes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq visible-bell 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Set line number to relative globally
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; Use Shitft+ArrowKeys to switch windows.
(windmove-default-keybindings)

;; Set the auto generated code to another file
(setq custom-file (concat user-emacs-directory "autogen-custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(when (eq nil (file-directory-p "~/.emacs.d/emacs-backup"))
  (make-directory "~/.emacs.d/emacs-backup"))

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/emacs-backup"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Fold long lines
(global-visual-line-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Package Management  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (require 'package)
 (package-initialize)

 ;; Adding Melpa
 ;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (when (not package-archive-contents)
   (package-refresh-contents))

 ;; Add all packages to install in this list
 (setq package-selected-packages
	'(ivy counsel swiper magit challenger-deep-theme company))
 (package-install-selected-packages)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Ivy, Counsel and Swiper ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings for ivy-counsel
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dired ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; allow to use 'a' key in dired buffers to open the folders/files in the same buffer rather than make a new one
(put 'dired-find-alternate-file 'disabled nil)
;; show file sizes in human readable format in dired
(setq dired-listing-switches "-alh")
;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Company ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Rice ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setting font
(set-face-attribute 'default nil
		      :family "VictorMono Nerd Font"
		      :height 150
		      :weight 'normal
		      :width 'normal)

;; Setting default theme
(load-theme 'challenger-deep 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Resize Windows ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function to resize window
(defun v-resize (key)
  "interactively resize the window" 
  (interactive "cHit '['/']' to enlarge/shrink vertically and '{'/'}' for horizontally")
  (cond
   ((eq key (string-to-char "["))
    (enlarge-window 1)
    (call-interactively 'v-resize))
   ((eq key (string-to-char "]"))
    (enlarge-window -1)
    (call-interactively 'v-resize))
   ((eq key (string-to-char "{"))
    (shrink-window-horizontally 1)
    (call-interactively 'v-resize))
   ((eq key (string-to-char "}"))
    (enlarge-window-horizontally 1)
    (call-interactively 'v-resize))
   (t (push key unread-command-events))))

(defun switch-buffer-recompile ()
  "switch to compilation buffer and then recompile"
  (interactive)
  (switch-to-buffer '"*compilation*")
  (recompile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-x[" 'v-resize)
(global-set-key "\C-x&" 'switch-buffer-recompile)
