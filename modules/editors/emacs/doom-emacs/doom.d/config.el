(setq user-full-name "Shaun Moate"
      user-mail-address "shaun.moate@gmail.com")

(setq doom-theme 'doom-one )

(setq doom-font (font-spec :family "JetBrains Mono" :size 16)
        doom-big-font (font-spec :famil "JetBrains Mono" :size 24))

(doom/set-frame-opacity 95)

(beacon-mode 1)

(setq org-directory "~/personal/notes")

(use-package org-superstar
            :ensure t
            :config
            (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq org-agenda-files (list "~/personal/notes/inbox.org"
                             "~/personal/notes/books.org"
                             "~/personal/notes/home.org"
                             "~/personal/notes/depop.org"))

(setq org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
        '((sequence
           "NOW(t)"            ; A task that is ready to be tackled
           "NEXT(n)"           ; This is a task I am likely to tackle next
           "LATER(l)"          ; Ideas for the future
           "|"                 ; The pipe necessary to separate "active" states and "inactive" states
           "DONE(d)"           ; Task has been completed
           "CANCELLED(c)" )))  ; Task has been cancelled

(setq org-todo-keyword-faces
      '(("NOW" . "yellow") ("NEXT" . "dark orange") ("LATER" . "orange") ("CANCELLED" . "black") ("DONE" . "dark grey")))

(setq org-agenda-custom-commands
  '(("d" "Default"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Quick Look Ahead")))
      (todo "LATER" ((org-agenda-overriding-header "Future Thinking")))))))

(setq org-refile-targets
      '(("archive.org" :maxlevel . 1)))
(advice-add 'org-refile :after 'org-save-all-org-buffers) ; save org buffers immediately after refiling to archive

(setq display-line-numbers-type 'relative)

(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

(add-hook 'term-mode-hook 'evil-insert-state)     ; when initially opening vterm load into INSERT mode (trust me, is better)

(map! :leader
      :desc "Toggle treemacs"
      "t t" #'treemacs)

(setq org-roam-directory (file-truename "~/personal/zettelkasten"))

(use-package org-roam
  :ensure t

  :init
  (setq org-roam-v2-ack t)

  :custom
  (org-roam-complete-everywhere t)
  (org-roam-dailies-directory "capture/")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>.org"
                         "#+title: ${title}\n#+created-date: %U\n#+last-modified: \n#+filetags: default\n\n")
      :unarrowed t)
   ("l" "literature" plain
      "* Summary\n%?{insert summary written in own words}\n\n* Chapter Review\n{insert review of chapter in own words}\n\n* Highlights\n+ {insert highlights from material}\n\n* Insights: \n+ {insert insights formed}"
      :if-new (file+head "%<%Y%m%d%H%M%S>.org"
                         "#+title: ${title}\n#+author: %^{Author}\n#+created-date: %U\n#+last-modified: %U\n#+source: [[%^{Source URL}][link]]\n#+filetags: literature\n\n")
      :unarrowed t)
   ("p" "permanent" plain
      "\n* Insight:\n%?{insert summary of insight in own words}\n\n* Further Insights:\n+ {insert insights that relate}\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>.org"
                         "#+title: ${title}\n#+created-date: %U\n#+last-modified: \n#+filetags: permanent\n\n")
      :unarrowed t))
   )

  :config
  (org-roam-setup)
)

(setq time-stamp-active t
      time-stamp-start "#\\+last-modified: [ \t]*"
      time-stamp-end "$"
      time-stamp-format "\[%Y-%m-%d %3a %02H:%02M\]")
(add-hook 'before-save-hook 'time-stamp nil)

(use-package! org-roam-ui
  :after org-roam

(use-package! websocket
  :after org-roam)

  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! simple-httpd
  :ensure t)

(map! :leader
      :desc "Paste from clipboard"
      "i p" #'clipboard-yank)
(map! :leader
      :desc "Copy to clipboard"
      "i y" #'clipboard-kill-ring-save)
(map! :leader
      :desc "Cut to clipboard"
      "i d" #'clipboard-kill-region)

(map! :leader
      :desc "Run org-bable-tangle"
      "h T" #'org-babel-tangle)
