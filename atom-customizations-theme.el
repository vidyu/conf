(deftheme atom-customizations
  "Customizations to use with atom thems")

(custom-theme-set-variables
 'atom-customizations
 '(blink-cursor-blinks 100)
 '(cursor-type (quote bar))
 '(scroll-bar-mode nil)
 '(global-hl-line-mode t)
 '(show-paren-mode t))

(custom-theme-set-faces
 'atom-customizations
 '(default ((t (:height 100 :family "Inconsolata LGC"))))
 '(ediff-current-diff-C ((t (:background "saddle brown"))))
 '(ediff-even-diff-A ((t (:background "gray32"))))
 '(ediff-even-diff-B ((t (:background "gray32"))))
 '(ediff-even-diff-C ((t (:background "gray32"))))
 '(ediff-fine-diff-B ((t (:background "dark green"))))
 '(ediff-odd-diff-A ((t (:background "gray24"))))
 '(ediff-odd-diff-B ((t (:background "gray24"))))
 '(ediff-odd-diff-C ((t (:background "gray24"))))
 '(hl-line ((t (:weight bold))))
 '(show-paren-match ((t (:underline t))))
 '(whitespace-indentation ((t (:foreground "dark gray"))))
 '(whitespace-newline ((t (:foreground "gray24" :weight normal))))
 '(whitespace-space ((t (:foreground "grey24"))))
 '(whitespace-space-after-tab ((t (:foreground "dark gray"))))
 '(font-lock-doc-face ((t (:foreground "dim gray"))))
 '(whitespace-tab ((t (:background "grey24" :foreground "darkgray")))))

(provide-theme 'atom-customizations)
