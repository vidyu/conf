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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-start nil)
 '(ac-trigger-key "TAB")
 '(auto-save-file-name-transforms (\` (("(?:[^/]/)(.*)" (\, (concat "~/.emacs.d/autosaves/" "")) t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-blinks 100)
 '(blink-cursor-mode t)
 '(coffee-tab-width 2)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8122f00211dbaf973fbe5831f808af92387c8fc1a44f0c6bcc9b22c16997c9dd" "cd2a93d7b63aff07b3565c1c95e461cb880f0b00d8dd6cdd10fa8ece01ffcfdf" default)))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode t)
 '(grunt-base-command "./node_modules/.bin/grunt")
 '(ido-mode (quote both) nil (ido))
 '(ido-vertical-mode t)
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(js2-mode-show-parse-errors nil)
 '(menu-bar-mode nil)
 '(org-agenda-clockreport-parameter-plist
   (quote
    (:link t :maxlevel 2 :inherit-props f :properties
           ("ID"))))
 '(org-agenda-include-diary t)
 '(org-agenda-inhibit-startup nil)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-with-clockreport-mode t)
 '(org-agenda-start-with-follow-mode t)
 '(org-clock-into-drawer t)
 '(org-clock-persist (quote history))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-jira-done-states (quote ("Closed" "Resolved" "Done" "Verified" "Committed")))
 '(org-jira-use-status-as-todo t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-jira)))
 '(org-time-clocksum-use-effort-durations t)
 '(org-todo-keywords
   (quote
    ((sequence "OPEN" "IN-PROGRESS" "REOPENED" "|" "COMMITTED" "DEPLOYED" "VERIFIED" "RESOLVED" "CLOSED")
     (sequence "TODO" "WORKING" "DONE"))))
 '(projectile-global-mode t)
 '(rich-minority-mode t)
 '(rm-blacklist "^.*&")
 '(safe-local-variable-values (quote ((eval ispell-change-dictionary "en"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(web-mode-attr-indent-offset 4)
 '(web-mode-auto-close-style 2)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-auto-quoting t)
 '(web-mode-enable-html-entities-fontification t)
 '(wg-emacs-exit-save-behavior nil)
 '(wg-prefix-key (kbd "C-z"))
 '(whitespace-line-column 120)
 '(workgroups-mode t)
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 100 :family "Inconsolata LGC"))))
 '(ediff-fine-diff-B ((t (:background "dark green"))))
 '(hl-line ((t (:weight bold))))
 '(show-paren-match ((t (:underline t))))
 '(whitespace-indentation ((t (:foreground "dark gray"))))
 '(whitespace-newline ((t (:foreground "gray24" :weight normal))))
 '(whitespace-space ((t (:foreground "grey24"))))
 '(whitespace-space-after-tab ((t (:foreground "dark gray"))))
 '(whitespace-tab ((t (:background "grey24" :foreground "darkgray")))))


;; laod js2-mode for js files
(load (concat dotfiles-dir "init/setup-js2"))


(load (concat dotfiles-dir "init/setup-web-mode"))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(load (concat dotfiles-dir "init/setup-ido"))

(put 'dired-find-alternate-file 'disabled nil)

(load (concat dotfiles-dir "init/setup-python"))

;;; init.el ends here
(put 'upcase-region 'disabled nil)
