;;; -*- coding: utf-8 -*-

;; --------------------------------------------------------------------------
;; Auto-Insert Stuff
;; --------------------------------------------------------------------------


(auto-insert-mode)
(setq auto-insert-query nil) ;do not ask before insertion
(setq auto-insert-alist
       '(
          ((python-mode . "Python Program")
          nil
"#!/usr/bin/env python
# -*- coding: utf-8 -*-

__version__ = 0.01
__author__ = \"" (user-full-name) "\"
\"\"\"Description:
\"\"\"



if __name__ == \"__main__\":
main()"
          )))


;; mark lines with width > 79 in python-mode
;; pep8 [1] advises not to write more then 79 char per line
;; [1] http://www.python.org/dev/peps/pep-0008/
;;
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{79\\}\\(.*\\)$" 1 font-lock-warning-face t)))))



;; on word-delete don't delete ' -- not only in Python
(modify-syntax-entry ?\' "$")

;; Highlight "FIXME" and "TODO" comments -- not only in Python
(defun add-fixme-highlighting ()
    "Turn on extra highlighting for 'FIXME' and the like."
    (font-lock-add-keywords nil
     '(("\\<\\(FIXME\\|TODO\\|XXX\\)" 1 font-lock-warning-face t))))
(add-hook 'find-file-hooks 'add-fixme-highlighting t)

; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 1) ; always show line numbers
(line-number-mode 1)
(column-number-mode 1)

;; Custom modules

(setq load-path (cons "/home/zope/.emacs.d" load-path))
(setq load-path (cons "/home/zope/.emacs.d/screen-lines" load-path))
(setq load-path (cons "/home/zope/.emacs.d/talcum" load-path))
(setq load-path (cons "/home/zope/.emacs.d/nxml-mode" load-path))

;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.cpy\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.pt\\'" . nxml-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-babel-hyphen "")
 '(LaTeX-fill-break-at-separators (quote (\\\( \\\) \\\[ \\\])))
 '(LaTeX-item-indent -2)
 '(LaTeX-menu-max-items 40)
 '(LaTeX-mode-hook (quote (LaTeX-preview-setup talcum-mode LaTeX-install-toolbar turn-on-reftex LaTeX-math-mode auto-fill-mode)) t)
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "alltt")))
 '(TeX-auto-local ".auto/")
 '(TeX-bar-LaTeX-buttons (quote (open-file save-buffer cut copy paste undo [separator nil] latex next-error view file bibtex clean latex-symbols-experimental nil)))
 '(TeX-close-quote "\"'")
 '(TeX-electric-escape nil t)
 '(TeX-insert-braces nil)
 '(TeX-newline-function (quote newline-and-indent))
 '(TeX-open-quote "\"`")
 '(TeX-style-local ".style/")
 '(abbrev-mode t)
 '(browse-url-browser-function (quote browse-url-mozilla))
 '(browse-url-mozilla-program "firefox")
 '(c-electric-pound-behavior (quote (alignleft)))
 '(column-number-mode t)
 '(comment-line-break-function (quote comment-indent-new-line) t)
 '(cua-enable-cua-keys (quote shift))
 '(cua-enable-cursor-indications t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(ecb-directories-menu-user-extension-function (quote ignore))
 '(ecb-display-image-icons-for-semantic-tags t)
 '(ecb-fix-window-size (quote width))
 '(ecb-grep-find-function (quote if))
 '(ecb-highlight-tag-with-point (quote highlight-scroll))
 '(ecb-history-item-name (quote buffer-name))
 '(ecb-history-menu-user-extension-function (quote ignore))
 '(ecb-kill-buffer-clears-history (quote auto))
 '(ecb-layout-name "left7")
 '(ecb-layout-window-sizes (quote (("left14" (0.14977973568281938 . 0.7258064516129032) (0.14977973568281938 . 0.25806451612903225)) ("left7" (0.24858757062146894 . 0.48333333333333334) (0.24858757062146894 . 0.18333333333333332) (0.24858757062146894 . 0.31666666666666665)) ("left8" (0.23076923076923078 . 0.2830188679245283) (0.23076923076923078 . 0.22641509433962265) (0.23076923076923078 . 0.3018867924528302) (0.23076923076923078 . 0.16981132075471697)))))
 '(ecb-method-non-semantic-face (quote ecb-default-general-face))
 '(ecb-methods-menu-user-extension-function (quote ignore))
 '(ecb-minor-mode-text "")
 '(ecb-non-semantic-exclude-modes (quote (sh-mode fundamental-mode text-mode LaTeX-mode)))
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-process-non-semantic-files t)
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(pyc\\|elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
 '(ecb-source-path (quote ("~/devel" "/")))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-sources-sort-method (quote extension))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-expand-symbol-before t)
 '(ecb-tree-image-icons-directories (quote ("/usr/share/emacs/site-lisp/ecb/ecb-images/default/height-17" (ecb-directories-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/directories/height-17") (ecb-sources-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/sources/height-14_to_21") (ecb-methods-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/methods/height-14_to_21"))))
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-version-check t)
 '(ecb-windows-width 0.25)
 '(file-cache-buffer "*File Cache*")
 '(file-cache-filter-regexps (quote ("~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$" "\\.$" "#$" "\\.class$" "\\.pyc$" "\\.svn/.*$")))
 '(file-cache-find-command-posix-flag t)
 '(filesets-data (quote (("Concurrence Python Files" (:tree-max-level 5)))))
 '(fill-column 80)
 '(flyspell-default-dictionary "german8")
 '(flyspell-use-meta-tab nil)
 '(folding-allow-overlays t)
 '(font-latex-quotes (quote auto))
 '(frame-background-mode nil)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-font-lock-mode t nil (font-core))
 '(global-hl-line-mode t)
 '(gnus-select-method (quote (nntp "news.individual.de")))
 '(grep-find-command "find . -name .svn -prune -o -type f -print0 | xargs -0 -e grep -nH -e ")
 '(grep-highlight-matches t)
 '(history-delete-duplicates t)
 '(icomplete-mode nil)
 '(igrep-options (quote -i) t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(isearch-allow-scroll t)
 '(isearch-resume-in-command-history nil)
 '(ispell-alternate-dictionary "/usr/lib/ispell/german.hash")
 '(ispell-complete-word-dict "/usr/lib/ispell/german.hash")
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-local-dictionary-alist nil)
 '(ispell-program-name "ispell" t)
 '(iswitchb-mode t)
 '(kill-whole-line t)
 '(lazy-highlight-cleanup nil)
 '(make-backup-file-name-function nil)
 '(make-backup-files nil)
 '(make-cursor-line-fully-visible t t)
 '(margin-column 90)
 '(minibuffer-electric-default-mode t)
 '(minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))
 '(normal-erase-is-backspace t)
 '(nxml-sexp-element-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(outline-blank-line t t)
 '(overflow-newline-into-fringe t)
 '(preview-default-document-pt 11)
 '(preview-transparent-color t)
 '(py-honor-comment-indentation (quote other))
 '(py-imenu-show-method-args-p t)
 '(py-shell-switch-buffers-on-execute nil)
 '(python-honour-comment-indentation t)
 '(python-use-skeletons t)
 '(recentf-mode t)
 '(save-place t nil (saveplace))
 '(screen-lines-minor-mode-string " \\/")
 '(screen-lines-mode t nil (screen-lines))
 '(scroll-bar-mode (quote right))
 '(search-exit-option t)
 '(search-upper-case nil)
 '(semantic-stickyfunc-indent-string "   ")
 '(semanticdb-global-mode t nil (semanticdb))
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images t)
 '(tab-width 4)
 '(tabbar-background-color "gray90")
 '(tabbar-cycle-scope (quote tabs))
 '(tabbar-mode t nil (tabbar))
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-separator (quote (1)))
 '(talcum-desired-features (quote (talcum-render talcum-newcmd)))
 '(talcum-use-prod-flag nil)
 '(talcum-verbosity 7)
 '(trex-unicode-mappings (quote (("forall" . 8704) ("complement" . 8705) ("partial" . 8706) ("exists" . 8707) ("emptyset" . 8709) ("nabla" . 8711) ("in" . 8712) ("notin" . 8713) ("ni" . 8715) ("qedhere" . 8718) ("prod" . 8719) ("coprod" . 8720) ("sum" . 8721) ("mp" . 8723) ("setminus" . 8726) ("circ" . 8728) ("cdot" . 8729) ("sqrt" . 8730) ("infty" . 8734) ("land" . 8743) ("wedge" . 8743) ("lor" . 8744) ("vee" . 8744) ("cap" . 8745) ("cup" . 8746) ("int" . 8747) ("iint" . 8748) ("iiiint" . 8749) ("neq" . 8800) ("ne" . 8800) ("leq" . 8804) ("le" . 8804) ("geq" . 8805) ("ge" . 8805) ("prec" . 8826) ("succ" . 8827) ("subset" . 8834) ("supset" . 8835) ("subseteq" . 8838) ("supseteq" . 8839) ("subsetneq" . 8842) ("supsetneq" . 8843) ("unlhd" . 8884) ("lhd" . 8882) ("unrhd" . 8885) ("rhd" . 8883) ("implies" . 10233) ("iff" . 10234) ("mapsto" . 10236) ("to" . 10230) ("longleftarrow" . 10229) ("longrightarrow" . 10230) ("longleftrightarrow" . 10231) ("Longleftarrow" . 10232) ("Longrightarrow" . 10233) ("leftarrow" . 8592) ("uparrow" . 8593) ("rightarrow" . 8594) ("downarrow" . 8595) ("leftrightarrow" . 8596) ("updownarrow" . 8597) ("dots" . 8230) ("ldots" . 8230) ("textperthousand" . 8240) ("bigodot" . 10752) ("bigoplus" . 10753) ("bigotimes" . 10754) ("lneq" . 10887) ("gneq" . 10888) ("wp" . 8472) ("ell" . 8467) ("Im" . 8465) ("Re" . 8476) ("Finv" . 8498) ("Game" . 8513) ("aleph" . 8501) ("beth" . 8502) ("gimel" . 8503) ("daleth" . 8504) ("alpha" . 945) ("beta" . 946) ("gamma" . 947) ("delta" . 948) ("epsilon" . 1013) ("varepsilon" . 949) ("zeta" . 950) ("eta" . 951) ("theta" . 952) ("vartheta" . 977) ("iota" . 953) ("kappa" . 954) ("varkappa" . 1008) ("lambda" . 955) ("mu" . 956) ("nu" . 957) ("xi" . 958) ("pi" . 960) ("varpi" . 982) ("rho" . 961) ("varrho" . 1009) ("sigma" . 963) ("varsigma" . 962) ("tau" . 964) ("upsilon" . 965) ("varphi" . 966) ("phi" . 981) ("chi" . 967) ("psi" . 968) ("omega" . 969) ("digamma" . 989) ("Gamma" . 915) ("Delta" . 916) ("Theta" . 920) ("Lambda" . 923) ("Xi" . 926) ("Pi" . 928) ("Sigma" . 931) ("Upsilon" . 933) ("Phi" . 934) ("Psi" . 936) ("Omega" . 937) ("N" . 8469) ("R" . 8477) ("Q" . 8474) ("C" . 8450) ("Z" . 8484) ("pm" . 177))))
 '(undo-limit 200000)
 '(undo-strong-limit 300000)
 '(uniquify-buffer-name-style (quote reverse) nil (uniquify))
 '(x-select-enable-clipboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 95 :width normal))))
 '(custom-button ((((type x w32 mac) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button) :height 90))))
 '(custom-button-mouse ((((type x w32 mac) (class color)) (:inherit custom-button :background "grey90" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(custom-button-pressed ((((type x w32 mac) (class color)) (:inherit custom-button :background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button)))))
 '(custom-button-pressed-face ((((type x w32 mac) (class color)) (:inherit custom-button-face :box (:line-width 2 :style pressed-button)))) t)
 '(custom-changed-face ((((class color)) (:inherit custom-documentation-face :background "blue" :foreground "white"))) t)
 '(custom-comment ((((class grayscale color) (background light)) (:inherit custom-documentation :background "gray85"))))
 '(custom-comment-face ((((class grayscale color) (background light)) (:inherit custom-documentation-face :background "gray85"))) t)
 '(custom-comment-tag ((((class color) (background light)) (:inherit custom-documentation :foreground "blue4"))))
 '(custom-comment-tag-face ((((class color) (background light)) (:inherit custom-documentation-face :foreground "blue4"))) t)
 '(custom-group-tag ((((min-colors 88) (class color) (background light)) (:inherit variable-pitch :foreground "blue1" :weight bold :height 1.2))))
 '(custom-group-tag-face ((((class color) (background light)) (:inherit variable-pitch :foreground "red" :weight bold :height 1.2))) t)
 '(custom-invalid-face ((((class color)) (:inherit custom-documentation-face :background "red" :foreground "yellow"))) t)
 '(custom-modified-face ((((class color)) (:inherit custom-documentation-face :background "blue" :foreground "white"))) t)
 '(custom-rogue-face ((((class color)) (:inherit custom-documentation-face :background "black" :foreground "pink"))) t)
 '(custom-saved-face ((t (:inherit custom-documentation-face :underline t))) t)
 '(custom-set-face ((((class color)) (:inherit custom-documentation-face :background "white" :foreground "blue"))) t)
 '(custom-state ((((class color) (background light)) (:inherit custom-documentation :foreground "dark green"))))
 '(custom-state-face ((((class color) (background light)) (:inherit custom-documentation-face :foreground "dark green"))) t)
 '(ecb-default-general-face ((((class color) (background light)) (:height 100))))
 '(ecb-default-highlight-face ((((class color) (background light)) (:inherit ecb-default-general-face :background "cornflower blue" :foreground "yellow"))))
 '(ecb-tag-header-face ((((class color) (background light)) (:background "SeaGreen1"))))
 '(ecb-tree-highlight-face ((((class color) (background light)) (:inherit (ecb-default-general-face highlight) :height 1.0))))
 '(flyspell-duplicate ((t (:foreground "Gold3" :underline t))))
 '(flyspell-incorrect ((t (:foreground "OrangeRed" :underline t))))
 '(font-latex-verbatim-face ((((class color) (background light)) (:inherit monotype-courier\ new :foreground "SaddleBrown"))))
 '(font-lock-comment-face ((t (:foreground "#0a0" :slant italic :height 1.0))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "Blue" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "Purple" :weight bold))))
 '(font-lock-string-face ((t (:foreground "firebrick" :height 1.0))))
 '(font-lock-type-face ((t (:foreground "#0b0" :weight bold))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background light)) (:background "yellow" :foreground "Red1" :slant normal :weight extra-bold))))
 '(fringe ((((class color) (background light)) (:background "grey96"))))
 '(highlight ((((class color) (min-colors 88) (background light)) (:background "#F5F5BB"))))
 '(margin-face ((t (:background "red"))) t)
 '(minibuffer-prompt ((t (:foreground "dark blue"))))
 '(mode-line ((t (:background "#FFBB44" :foreground "black" :box (:line-width 3 :color "#FFBB44") :height 100))))
 '(mode-line-buffer-id ((t (:foreground "#990000" :weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88) (background light)) (:inherit mode-line :background "RoyalBlue4" :foreground "white" :box (:line-width 2 :color "RoyalBlue4")))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey90" :foreground "grey20" :box (:line-width 3 :color "grey90") :weight light))))
 '(py-XXX-tag-face ((t (:background "yellow" :foreground "#f00"))) t)
 '(py-builtins-face ((t (:inherit font-lock-keyword-face :weight normal))) t)
 '(py-pseudo-keyword-face ((t (:inherit font-lock-keyword-face :weight normal))) t)
 '(semantic-dirty-token-face ((((class color) (background light)) (:background "gray96"))))
 '(semantic-unmatched-syntax-face ((((class color) (background light)) nil)))
 '(speedbar-directory-face ((((class color) (background light)) (:inherit speedbar-file-face :foreground "blue4"))))
 '(speedbar-file-face ((((class color) (background light)) (:foreground "cyan4" :family "microsoft-tahoma"))))
 '(speedbar-highlight-face ((((class color) (background light)) (:inherit speedbar-file-face :background "green"))))
 '(speedbar-selected-face ((((class color) (background light)) (:inherit speedbar-file-face :foreground "red" :underline t))))
 '(speedbar-tag-face ((((class color) (background light)) (:inherit speedbar-file-face :foreground "brown"))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default :background "white" :box (:line-width 2 :color "white")))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray90" :foreground "gray50" :box (:line-width 3 :color "gray90") :height 100))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "blue" :weight bold))))
 '(tabbar-separator ((t (:inherit tabbar-default))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(trex-unicode-face ((t (:weight normal :height 140 :width normal :family "misc-fixed"))))
 '(variable-pitch ((t (:height 105))))
 '(widget-documentation ((((class color) (background light)) (:inherit custom-documentation :foreground "dark green")))))






;; Screw up memory usage
(setq gc-cons-threshold 4000000)

(setq font-lock-maximum-decoration t)

;; enable Unicode characters for Xft-Emacs
(set-fontset-font "fontset-default" 'latin '("bitstream vera sans mono" . "unicode-bmp"))

;; ReST mode
(autoload 'rst-mode "rst-mode" "mode for editing reStructuredText documents" t)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

;;; show-blanks mode
;(require 'blank-mode)
;;; Subversion stuff
(require 'vc-svn)

;; grep
(require 'grep)
(load-library "grep")

;; igrep mode
(setq igrep-options "-i")
(defalias 'grep-find 'igrep-find)

;; ecb mode
(require 'ecb)

;; screen-lines-mode: arrow-up and arrow-down move in lines as shown on the
;; screen, not physically
(autoload 'screen-lines-mode "screen-lines"
          "Toggle Screen Lines minor mode for the current buffer." t)
(autoload 'turn-on-screen-lines-mode "screen-lines"
          "Turn on Screen Lines minor mode for the current buffer." t)
(autoload 'turn-off-screen-lines-mode "screen-lines"
          "Turn off Screen Lines minor mode for the current buffer." t)

;; background color
(set-background-color "gray97")

;;;;;;;;;;;;;;; Custom keybindings ;;;;;;;;;;;;;;;

;; select all
(global-set-key "" 'mark-whole-buffer)

;; Swap Save and Isearch
(global-set-key "" 'save-buffer)
(global-set-key "" 'isearch-forward)

;; Custom margin keys (useful for Python indentation)
(global-set-key [?\M-\C-+] 'increase-left-margin)
(global-set-key [?\M-\C--] 'decrease-left-margin)

;; Shortcuts for killing buffers
;(global-set-key "k" 'kill-this-buffer)
;(global-set-key "" 'kill-buffer-and-window)
;; invoked by C-x C-M-k: remove help screens permanently
(defun kill-other-buffer-and-window ()
  "Kill other window's buffer and the window."
  (interactive "")
  (other-window 1)
  (kill-buffer-and-window))
;(global-set-key "" 'kill-other-buffer-and-window)

(defun kill-other-buffer ()
  "Kill other window's buffer."
  (interactive "")
  (other-window 1)
  (kill-buffer nil)
  (other-window 1))
;(global-set-key "K" 'kill-other-buffer)

;; Get a buffer menu with the right mouse button. 
(global-set-key [mouse-3] 'mouse-buffer-menu)

;; Instead of M-g g
(global-set-key [?\M-\C-g] 'goto-line)

;; tabbar: goto next/previous tab
(global-set-key [C-prior] 'tabbar-backward)
(global-set-key [C-next] 'tabbar-forward)

;; F6 stores a position in a file, F7 brings you back to this position
(global-set-key [f6] '(lambda () (interactive) (point-to-register ?1)))
(global-set-key [f7] '(lambda () (interactive) (register-to-point ?1)))

;;;;;;;; Scrolling stuff ;;;;;;;;
;; Scroll without moving cursor
(global-set-key '[C-M-up] '(lambda () (interactive) (scroll-down 1)))
(global-set-key '[C-M-down] '(lambda () (interactive) (scroll-up 1)))
(global-set-key '[M-up] '(lambda () (interactive) (scroll-down 5)))
(global-set-key '[M-down] '(lambda () (interactive) (scroll-up 5)))

;; Scroll one line at a time
(setq scroll-step 1)

;; Make "yes or no" "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; More powerful tab-completion
(add-hook 'minibuffer-setup-hook    
          '(lambda ()  
         (define-key minibuffer-local-map "\t" 'comint-dynamic-complete)))

;; Window frame title
(setq frame-title-format "emacs [%b %*%+ %f]")
(setq icon-title-format "emacs [%b]")

;; No bells please
(setq ring-bell-function (lambda nil nil))

;; 24-hr time format
(setq display-time-24hr-format t)
(display-time)

;; make all backups in a single directory
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.backups"))))

;; Mouse scroll
(setq mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))

;; Enable otherwise disabled commands
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Find file at point lets you put the point over a file name and open
;; it with C-x C-f.
(ffap-bindings)

;; abbrev-mode
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrevs")
(setq save-abbrevs t)

;; Alt-space is dabbrev-expand
(global-set-key " " (quote dabbrev-expand))

;; C-y is redo
(global-set-key [?\C-y] (quote redo))

;; C-k is kill-whole-line
(global-set-key "\C-k" 'kill-whole-line)

;; fixup-whitespace puts the "right" amount of whitespace at the point
(global-set-key [?\S- ] 'fixup-whitespace)
;; M-del should delete forward
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Martin Blais' dubious paragraphs
;;(require 'dubious-paragraphs)
;;(global-set-key [(meta n)] 'dubious-forward-paragraph)
;;(global-set-key [(meta N)] 'dubious-forward-paragraph-scroll)
;;(global-set-key [(meta p)] 'dubious-backward-paragraph)
;;(global-set-key [(meta P)] 'dubious-backward-paragraph-scroll)

;; Martin Blais' repeatable macros
;;(require 'repeatable)
;;(repeatable-command-advice kmacro-end-and-call-macro)

;; C Style for editing new CPython source files
(c-add-style
 "python-new"
 '((indent-tabs-mode . nil)
   (fill-column      . 78)
   (c-basic-offset   . 4)
   (c-offsets-alist  . ((substatement-open . 0)
                        (inextern-lang . 0)
                        (arglist-intro . +)
                        (knr-argdecl-intro . +)))
   (c-hanging-braces-alist . ((brace-list-open)
                              (brace-list-intro)
                              (brace-list-close)
                              (brace-entry-open)
                              (substatement-open after)
                              (block-close . c-snug-do-while)))
   (c-block-comment-prefix . ""))
 )

(add-to-list 'c-default-style '(c-mode . "python-new"))

;; Indent with newline in C mode
(defun my-c-hook ()
  (local-set-key "\r" 'newline-and-indent))

(add-hook 'c-mode-hook 'my-c-hook)

;; Close HTML tags with C-t in sgml mode
(defun my-sgml-hook ()
  (local-set-key (kbd "C-t") 'sgml-close-tag))

(add-hook 'sgml-mode-hook 'my-sgml-hook)

;; (defun search-for-this-word ()
;;   (interactive)
;;   (backward-word)
;;   (isearch-mode t)
;;   (isearch-yank-word)
;;   (isearch-repeat-forward))
;; (global-set-key [(control +)] 'search-for-this-word)
;; (global-set-key [(control *)] 'isearch-lazy-highlight-cleanup)

;;;;;;;;;;;;;; python folding ;;;;;;;;;;;;;;;;;;;;
(defun py-outline-level ()
  "This is so that `current-column` DTRT in otherwise-hidden text"
  ;; from ada-mode.el
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "\t ")
      (current-column))))

; this fragment originally came from the web somewhere, but the outline-regexp
; was horribly broken and is broken in all instances of this code floating
; around.  Finally fixed by Charl P. Botha <http://cpbotha.net/>
(defun my-python-hook ()
  (setq outline-regexp "[ \t]*\\(def[ \t]+\\|class[ \t]+\\)")
  ; enable our level computation
  (setq outline-level 'py-outline-level)
  ; do not use their \C-c@ prefix, too hard to type. Note this overides 
  ;some python mode bindings
  (setq outline-minor-mode-prefix "\C-c")
  (local-set-key (kbd "C-c <left>") 'hide-subtree)
  (local-set-key (kbd "C-c <right>") 'show-subtree)
  ; turn on outline mode
  (outline-minor-mode t)
  ; initially hide all but the headers
  (hide-body)
  ; more python goodies
  (show-paren-mode 1)
  (reveal-mode 1)
  ;(py-complete-bind-hippie-expand)
  ;(global-set-key (kbd "M-<SPC>") 'hippie-expand)
  ; bind tempo electric space
  (local-set-key " " 'tempo-electric-space)
  (local-set-key (kbd "C-+") 'tempo-forward-mark)
)

(add-hook 'python-mode-hook 'my-python-hook)

;; highlight XXX style code tags in Python and LaTeX documents
(font-lock-add-keywords 'python-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))

(font-lock-add-keywords 'latex-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))


;; tempo mode: code templates
(require 'tempo)
(defvar python-tempo-tags nil
  "Tempo tags for Python mode")
(add-hook 'python-mode-hook '(lambda ()
                               (tempo-use-tag-list 'python-tempo-tags)))

(tempo-define-template "classdef"
                       '( > "class " p "(" p "):" n
                          > "\"\"\"" n
                          > p n
                          > "\"\"\"" n
                          > n
                          > "def __init__(self, " p "):" n
                          > p )
                       "classdef"
                       "Insert a class statement"
                       'python-tempo-tags)

(defun tempo-electric-space ()
  ""
  (interactive)
  (if (tempo-expand-if-complete)
      nil
    (insert " ")))


;;;;;;;; LaTeX stuff ;;;;;;;;

(require 'tex-site)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq-default TeX-master nil)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-include-file-commands '("include" "input" "includedoc"))
(setq reftex-vref-is-default t)
(setq TeX-electric-escape t)

;; Enable preview-latex
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
(setq preview-auto-cache-preamble t)

;; talcum-mode: replaces LaTeX commands by Unicode symbols
(autoload 'talcum-mode "talcum")
(add-hook 'LaTeX-mode-hook 'talcum-mode)

;; show ascii table

(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;;;;;;;;;;;; EMACS STUFF ;;;;;;;;;;;;;;

;; Alle ~ -Dateien im Ordner .emacs_backup speichern
(setq backup-directory-alist '(("." . "~/.emacs_backup")))
 
(desktop-save-mode 1)

;;(pymacs-load "paste")
; um das Menü zu aktivieren
;;(paste-menu)
 


