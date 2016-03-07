;;; package --- The config for web-mode
;;; Commentary:
;;; Code:

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml?\\'" . web-mode))
(defvar web-mode-engines-alist '(("angular" . "\\.*melon-webapp/.*.html\\'")))

(provide 'setup-web-mode)
;;; setup-web-mode.el ends here
