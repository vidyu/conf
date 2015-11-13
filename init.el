;; package --- Initfile
;;; Commentary:
;;; Code:
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
 '(auto-save-file-name-transforms (\` (("(?:[^/]/)(.*)" (\, (concat autosave-dir "")) t))))
 '(blink-cursor-blinks 100)
 '(blink-cursor-mode t)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8122f00211dbaf973fbe5831f808af92387c8fc1a44f0c6bcc9b22c16997c9dd" "cd2a93d7b63aff07b3565c1c95e461cb880f0b00d8dd6cdd10fa8ece01ffcfdf" default)))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode t)
 '(grunt-base-command "./node_modules/.bin/grunt")
 '(ido-mode (quote both) nil (ido))
 '(ido-vertical-mode t)
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
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
 '(org-todo-keywords
   (quote
    ((sequence "OPEN" "IN-PROGRESS" "REOPENED" "|" "COMMITTED" "RESOLVED")
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
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'whitespace-mode)
(add-hook 'js2-mode-hook 'whitespace-cleanup-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defvar web-mode-engines-alist '(("angular" . "\\.*melon-webapp/.*.html\\'")))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; To modify the keybindings, use the ido-setup-hook.  For example:
(require 'ido)
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map (kbd "M-f") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-b") 'ido-prev-match)
  (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-p") 'ido-prev-match)
  )


(put 'dired-find-alternate-file 'disabled nil)
;;; init.el ends here
