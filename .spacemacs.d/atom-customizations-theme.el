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
 '(ediff-even-diff-A ((t (:background "grey32"))))
 '(ediff-even-diff-B ((t (:background "grey32"))))
 '(ediff-even-diff-C ((t (:background "grey32"))))
 '(ediff-fine-diff-B ((t (:background "dark green"))))
 '(ediff-odd-diff-A ((t (:background "grey24"))))
 '(ediff-odd-diff-B ((t (:background "grey24"))))
 '(ediff-odd-diff-C ((t (:background "grey24"))))
 '(hl-line ((t (:weight bold))))
 '(show-paren-match ((t (:underline t))))
 '(whitespace-indentation ((t (:foreground "grey4"))))
 '(whitespace-newline ((t (:foreground "grey4" :weight normal))))
 '(whitespace-space ((t (:foreground "grey4"))))
 '(whitespace-space-after-tab ((t (:foreground "grey4"))))
 '(font-lock-doc-face ((t (:foreground "dim grey"))))
 '(whitespace-tab ((t (:background "grey4" :foreground "darkgrey")))))

(provide-theme 'atom-customizations)
