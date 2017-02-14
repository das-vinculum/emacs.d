(deftheme TSDH mod
  "Created 2017-02-14.")

(custom-theme-set-variables
 'TSDH mod
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(mode-require-final-newline t)
 '(package-selected-packages (quote (ample-theme powerline powerline-evil dired+ exec-path-from-shell git-gutter auto-complete indent-guide linum-relative helm-git-files helm-git-grep magit magithub helm-ag helm-ag-r helm-fuzzier helm-projectile jdee scala-mode yaml-mode projectile evil evil-args evil-cleverparens evil-ediff evil-matchit evil-surround helm)))
 '(require-final-newline t))

(provide-theme 'TSDH mod)
