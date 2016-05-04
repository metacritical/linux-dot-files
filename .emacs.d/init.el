;;; init.el -- Stolen From Milkman's init el.

;; Turn off mouse interface early in startup to avoid momentary display
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please... jeez
(setq inhibit-startup-screen t)

;; IDO-mode
(ido-mode t)

;;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-update-interval 5)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'spacemacs-dark t)
;;(load-theme 'misterioso t)


;; Awesome Package Installer
(defvar awesome-packages
  '(
    ag
    ;; auto-complete
    ;; base16-theme
    clojure-mode
    company
    ;; deft
    dired+
    ;; dropdown-list
    evil
    ;; flx
    ;; gist
    rainbow-delimiters
    smartparens
    ace-jump-mode
    browse-kill-ring
    diminish
    expand-region
    ido-ubiquitous
    ido-vertical-mode
    magit
    multiple-cursors
    smex
    undo-tree
    spaceline
    emoji-cheat-sheet-plus
    ac-emoji
    fancy-battery
    company-emoji
    confluence
    go-autocomplete
    go-mode
    ))

(defun install-awesome-packages ()
  "Install Custom Packages from package list."
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        awesome-packages))


;; Enable Packages
(evil-mode t)

;; Elips Related functionality
(defun elisp-group()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'elisp-group)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; Spaceline
(require 'spaceline-config)
;;Theme alternates for spaceline.
;;(spaceline-spacemacs-theme)
(spaceline-emacs-theme)

;; Emoji Cheetsheet
(add-to-list 'load-path "~/.emacs.d/elpa/emoji-cheat-sheet-plus-20150617.631/emoji-cheat-sheet/")
(require 'emoji-cheat-sheet-plus)

;; Fancy Battery
(add-hook 'after-init-hook #'fancy-battery-mode)
(display-battery-mode t)

;; Desktop Save Mode
(desktop-save-mode 1)

;; Org Mode Dropbox
;; Set org local files directory.
(setq org-directory "~/Dropbox/miNotes")
(setq org-agenda-files '("~/Dropbox/miNotes/index.org"))
;; Set the file name where new notes will be stored.
(setq org-mobile-inbox-for-pull "~/Dropbox/miNotes/index.org")
;; Org mobile directory.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; Org Pomodoro
;; Set Default timer value
(setq org-timer-default-timer 25)
;; Timer is started with default value unless the Timer is already Begun.
(add-hook 'org-clock-in-hook (lambda ()
      (if (not org-timer-current-timer) 
	  (org-timer-set-timer '(16)))))

;; Company Emoji mode.
(require 'company-emoji)
(add-to-list 'company-backends 'company-emoji)

;;Tuareg mode for ocaml
(load "/home/pd/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;;caml-mode
(add-to-list 'load-path "/home/pd/.opam/system/share/emacs/site-lisp/")
