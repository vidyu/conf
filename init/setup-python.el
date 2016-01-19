;;; package --- The config for python
;;; Commentary:
;;; Code:

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.virtualenvs/")

(add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)   ; optional
;; (setq jedi:complete-on-dot t)  ;optional

(provide 'setup-python)
;;; setup-python.el ends here
