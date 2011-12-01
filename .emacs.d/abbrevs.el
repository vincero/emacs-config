(define-skeleton python-openfile-skeleton
  "Inserts file open"
  "File name: "
  "try:" \n
  "f = open('" str "')" \n
  _ \n
  "except OSError:" (indent-for-tab-command) \n
  "print 'Sorry.'")


(define-abbrev-table 'python-mode-abbrev-table
  '(("openfile" "" python-openfile-skeleton 0)
    ("shebang" "#!/usr/bin/env python" nil 1)
    ("utf8" "# -*- coding: utf-8 -*-" nil 1)
    ))
