;;;
;;; init.el - my configurations
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get configurations
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path (locate-user-emacs-file "el-get-user/recipes"))

;; Folowing line MUST only enable initial startup...
;(el-get 'sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bind-key package
(el-get-bundle bind-key)
(require 'bind-key)

;; helm-mode configuration
(el-get-bundle helm
  (bind-key "C-x b" 'helm-mini)
  (bind-key "C-x M-f" 'helm-find-files))

;; helm-gtags-mode configuration
(el-get-bundle helm-gtags
  (bind-key "M-t" 'helm-gtags-find-tag)
  (bind-key "M-s" 'helm-gtags-find-symbol)
  (bind-key "C-t" 'helm-gtags-pop-stack)
  (bind-key "M-r" 'helm-gtags-find-rtag))

;; company-mode configuration
(el-get-bundle company-mode
  (global-company-mode))

;; flycheck configuration
(el-get-bundle flycheck
  (global-flycheck-mode))

;; confiture themes
;(el-get-bundle base16)
(el-get-bundle moe-theme
  (require 'moe-theme)
  (moe-theme-set-color 'green)
  (moe-light))

(global-hl-line-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (flycheck helm-gtags helm bind-key el-get)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "PfEd" :slant normal :weight normal :height 136 :width normal)))))
