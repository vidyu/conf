;;; package --- The config for php
;;; Commentary:
;;; Code:


(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(add-hook 'php-mode-hook 'my-php-setup)

(defun my-php-setup ()
  "The config for php."
  (ggtags-mode 1)
  (hs-minor-mode 1)
  (require 'ac-php-company))
          
(provide 'setup-php)
;;; setup-php.el ends here
