;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Zhe Li"
      user-mail-address "linuxcity.jn@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "Source Code Pro for Powerline" :size 13)
      doom-font (font-spec :family "FiraCode Nerd Font" :size 13)
      ;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
      doom-variable-pitch-font (font-spec :family "Fira Mono for Powerline" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/gtd/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! org
  ;; See https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
  ;; capture GTD tasks
  (setq org-capture-templates '(
                                ("n" "[inbox]" entry
                                 (file+headline "~/Dropbox/gtd/inbox.org" "Tasks")
                                 "* %i%?")
                                ("t" "Todo [inbox]" entry
                                 (file+headline "~/Dropbox/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/Dropbox/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %U")
                                ))

  (setq org-agenda-files '(
                           "~/Dropbox/gtd/gtd.org"
                           "~/Dropbox/gtd/inbox.org"
                           "~/Dropbox/gtd/tickler.org"))

  (setq org-refile-targets '(("~/Dropbox/gtd/gtd.org" :maxlevel . 3)
                             ("~/Dropbox/gtd/inbox.org" :maxlevel . 3)
                             ("~/Dropbox/gtd/notes.org" :maxlevel . 2)
                             ("~/Dropbox/gtd/projects.org" :level . 1)
                             ("~/Dropbox/gtd/someday.org" :maxlevel . 2)
                             ("~/Dropbox/gtd/tickler.org" :maxlevel . 2)))

  (setq org-tag-alist
      '(
;; ("@Computer" . ?u)
;; ("@Offline" . ?f)
  ;;         ("financialfreedom" . ?f)
  ;;         ("idea" . ?i)
  ;;         ("@Business" . ?b)
  ;;         ("@PM" . ?p)
  ;;         ("@HomeCoding" . ?k)
  ;;         ("@Errands" . ?e)
  ;;         ("@DIY" . ?d)
  ;;         ("@Family" . ?y)
  ;;         ("@DeepWork" . ?w)
  ;;         ("@Quick" . ?q)
  ;;         ("thisweek" . ?t)
        (:startgroup . nil)
        ("@Admin" . ?a)
        ("@Coding" . ?d)
        ("@Comms" . ?c)
        ("@Ops" . ?o)
        ("@Research" . ?e)
        ("@Review" . ?v)
        ("@Phone" . ?p)
        (:endgroup . nil)

        (:startgroup . nil)
        ("@Computer" . ?m)
        ("@Home" . ?h)
        ("@Offline" . ?h)
        (:endgroup . nil)

        (:startgroup . nil)
        ("@LowEnergy" . ?l)
        ("@HighEnergy" . ?h)
        (:endgroup . nil)

        ("thisweek" . ?t)
        ("reference" . ?r)
        ))

  (setq org-use-fast-tag-selection t)
  (setq org-fast-tag-selection-include-empty t)

  (setq org-tags-column -80) ; optional formatting
  (setq org-fast-tag-selection-include-other t)

  (setq org-agenda-custom-commands
        '(("o" "Admin tasks" tags-todo "@admin"
           ((org-agenda-overriding-header "Admin")))

          ("b" "Important but not urgent"
           tags-todo "GTD"
           keywords "+[#B]"
           ((org-agenda-overriding-header "Important but not urgent")))

          ("W" "Weekly review" agenda ""
           ((org-agenda-span 'week)
            (org-agenda-start-on-weekday 1)
            (org-agenda-start-with-log-mode t)
            (org-agenda-skip-function
             '(org-agenda-skip-entry-if 'nottodo 'done))))))

  (setq org-log-done 'time))

(after! magit
  (setq git-commit-summary-max-length 70)
  (setq git-commit-style-convention-checks ()))

(after! flycheck
  (setq flycheck-yaml-yamllint-executable "pipx run yamllint"))

;; github copilot
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  (add-to-list 'copilot-indentation-alist '(text-mode 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2)))
;; For some reason my copilot cannot find node executable ever
;; (after! copilot
;;     (setq copilot-node-executable "~/.nvm/versions/node/v18.16.1/bin/node"))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-show-numbers t))


;; Trigger action from emacs
(defun zl/launch-github-action ()
  (interactive)
  (when buffer-file-name
    (let (
          (default-directory (file-name-directory buffer-file-name))
          (filename (file-name-nondirectory buffer-file-name)))
      (save-buffer)
      (let ((output (shell-command-to-string
                     (concat "gh workflow run --ref $(git rev-parse --abbrev-ref HEAD) " filename " 2>&1"))))
        (message output)))))

(defun zl/tramp-home-shortcut ()
  "Shortcut for connecting to SSH server"
  (interactive)
  (find-file (concat "/sshx:zzz@192.168.1.47:/home/zzz/code")))

(map! :leader
      (:prefix-map ("z" . "My tools")
       :desc "Connect to home SSH server" "z" #'zl/tramp-home-shortcut
       :desc "Run github actions" "y" #'zl/launch-github-action))


;; ;; Remove id attributes from markdown output
;; (defun markdown-body-id-filter (output backend info)
;;   "Remove random ID attributes generated by Org."
;;   (when (eq backend 'markdown)
;;     (replace-regexp-in-string
;;      " id=\"[[:alpha:]-]*org[[:alnum:]]\\{7\\}\""
;;      ""
;;      output t)))
;; (add-to-list 'org-export-filter-final-output-functions 'markdown-body-id-filter)
