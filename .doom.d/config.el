;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;(setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "NotoMono Nerd Font" :size 15 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "NotoSans Nerd Font" :size 15)
       doom-big-font (font-spec :family "NotoMono Nerd Font" :size 22)
       )

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq TeX-global-PDF-mode t)

(map! :leader
      :desc "Seite suchen in PDF"
      "m g" #'pdf-view-goto-page)

(map! :leader
      :desc "enable line mode "
      "d" #'display-line-numbers-mode)

(map! :leader
      :desc "pdf go next page "
      "j" #'pdf-view-next-page)

(map! :leader
      :desc "enable line mode "
      "k" #'pdf-view-previous-page)

(after! tex 
 (setq TeX-view-program-selection
        '(
          (output-pdf "PDF Tools")
          (output-pdf "Zathura")
         )))

(setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil)

(defun my-run-biber ()
  "Run Biber on the current TeX document."
  (interactive)
  (TeX-command "Biber" 'TeX-master-file))

(map! :leader
      :desc "enable line mode "
      "b i" #'my-run-biber)
