(setq visible-bell 1)
;(menu-bar-mode -1)
;; Set line number to relative globally
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Installing ivy, counsel and swiper
(add-to-list 'load-path "~/.emacs.d/swiper")
(require 'ivy)
(require 'counsel)
(require 'swiper)

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

(global-set-key "\C-x{" 'v-resize)

;; Theme
;;(load-theme 'nano-dark)
