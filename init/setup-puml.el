;;; package --- The config for puml
;;; Commentary:
;;; Code:


;; Enable puml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

(customize-set-variable 'puml-plantuml-jar-path (concat dotfiles-dir "lib/plantuml.jar"))

(provide 'setup-puml)
;;; setup-puml.el ends here
