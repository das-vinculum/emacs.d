;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(load-theme 'ample t t) (load-theme 'ample-flat t t)
(load-theme 'ample-light t t)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/Users/fzeidler/repositories/golang")
(add-to-list 'exec-path "/Users/fzeidler/.go/bin/")

(require 'evil)
(evil-mode 1)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(show-paren-mode 1)
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
(require 'git-gutter)
;; If you enable global minor mode
(global-git-gutter-mode t)
;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
(defun auto-complete-for-go ()
(auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
(eval-after-load "go-mode"
  '(require 'flymake-go))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(setq indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (ample)))
 '(jdee-server-dir "home/fzeidler/jdee-server")
 '(log-edit-require-final-newline t)
 '(mode-require-final-newline t)
 '(package-selected-packages
   (quote
    (neotree nginx-mode flymake-go flymake-puppet godoctor go-complete go-rename go-autocomplete go-mode terraform-mode puppet-mode dockerfile-mode ample-theme powerline powerline-evil dired+ exec-path-from-shell git-gutter auto-complete indent-guide linum-relative helm-git-files helm-git-grep magit magithub helm-ag helm-ag-r helm-fuzzier helm-projectile jdee scala-mode yaml-mode projectile evil evil-args evil-cleverparens evil-ediff evil-matchit evil-surround helm)))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
