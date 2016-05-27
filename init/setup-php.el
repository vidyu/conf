;;; package --- The config for php
;;; Commentary:
;;; Code:


(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(add-hook 'php-mode-hook 'my-php-setup)

(defun my-php-setup ()
  "The config for php."
  (make-variable-buffer-local 'company-backends)
  (add-to-list 'company-backends 'company-ac-php-backend)
  (add-to-list 'company-backends 'company-gtags)
  (ggtags-mode 1)
  (hs-minor-mode 1)
  (require 'ac-php-company)
  ;; (whitespace-mode)
  (whitespace-cleanup-mode)
  (define-key php-mode-map  (kbd "C-;") 'company-other-backend))
          
(provide 'setup-php)
;;; setup-php.el ends here
