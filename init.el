;; package --- Initfile
;;; Commentary:
;;; Code:


;; base load path
(defconst dotfiles-dir
  (file-name-directory
   (or (buffer-file-name) load-file-name))
  "Base path for customised Emacs configuration.")

; Syntactic sugar for eval-after-load dance.
;; https://github.com/purcell/emacs.d/blob/aa789c9745b13612c4fea6e638d81d8ebbfecdf8/init-utils.el#L1-L5
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(require 'cask)
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'workgroups2)

(load (setq custom-file (concat dotfiles-dir "custom.el")) t)

;; laod js2-mode for js files
(load (concat dotfiles-dir "init/setup-js2"))

(load (concat dotfiles-dir "init/setup-puml"))

(load (concat dotfiles-dir "init/setup-web-mode"))

(load (concat dotfiles-dir "init/setup-php"))

(load (concat dotfiles-dir "init/setup-whitespace"))


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(load (concat dotfiles-dir "init/setup-ido"))

(put 'dired-find-alternate-file 'disabled nil)

(load (concat dotfiles-dir "init/setup-python"))

(load (concat dotfiles-dir "init/setup-window"))

;;; init.el ends here
(put 'upcase-region 'disabled nil)
