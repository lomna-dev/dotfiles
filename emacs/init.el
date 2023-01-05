;; Set default encoding for files
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
;; do this especially on Windows, else python output problem
(set-terminal-coding-system 'utf-8-unix)

;; Load the config file
(org-babel-load-file "~/.emacs.d/config.org")

;; allow to use 'a' key in dired buffers to open the folders/files in the same buffer rather than make a new one
(put 'dired-find-alternate-file 'disabled nil)
;; show file sizes in human readable format in dired
(setq dired-listing-switches "-alh")
