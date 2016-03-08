;;; package --- The config for js2mode
;;; Commentary:
;;; Code:

;; laod js2-mode for js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'whitespace-mode)
(add-hook 'js2-mode-hook 'whitespace-cleanup-mode)

(after-load 'js2-mode
            (after-load 'flycheck
                        (add-to-list 'exec-path (concat dotfiles-dir "node_modules/.bin/"))))

(provide 'setup-js2)
;;; setup-js2.el ends here
