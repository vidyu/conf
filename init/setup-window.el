;;; package --- The config for window
;;; Commentary:
;;; Code:

;; To modify the keybindings, use the window-setup-hook.  For example:

(defun on-after-init ()
  "Remove the background of an window."
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))
    (set-face-background 'hl-line "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(provide 'setup-window)
;;; setup-window.el ends here
