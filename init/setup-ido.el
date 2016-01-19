;;; package --- The config for ido
;;; Commentary:
;;; Code:

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

(provide 'setup-ido)
;;; setup-ido.el ends here
