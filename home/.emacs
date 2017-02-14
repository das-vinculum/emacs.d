;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'evil)
(evil-mode 1)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq ns-right-alternate-modifier nil)
(projectile-global-mode)
(ac-config-default)
(setq
 backup-by-copying t
 delete-old-versions t
 Kept-new-versions 6
 kept-old-versions 2
 version-control t)
(require 'linum-relative)
(global-linum-mode)
(require 'indent-guide)
(indent-guide-global-mode)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(jdee-server-dir "home/fzeidler/jdee-server")
 '(log-edit-require-final-newline t)
 '(mode-require-final-newline t)
 '(package-selected-packages
   (quote
    (auto-complete indent-guide linum-relative helm-git-files helm-git-grep magit magithub helm-ag helm-ag-r helm-fuzzier helm-projectile jdee scala-mode yaml-mode projectile evil evil-args evil-cleverparens evil-ediff evil-matchit evil-surround helm)))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
