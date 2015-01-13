(add-to-list 'load-path "~/Scratch/org-7.9.2/lisp")
(add-to-list 'load-path "~/Scratch/org-7.9.2/contrib/lisp" t)
(require 'org-install)
(org-babel-do-load-languages 'org-babel-load-languages '( (sh . t) (R . t) (perl . t) (ditaa . t) ))
(setq org-confirm-babel-evaluate nil)
(unless (boundp 'org-export-latex-classes) (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes '(
    "llncs" 
    "\\documentclass{llncs}\n \[NO-DEFAULT-PACKAGES]\n \[EXTRA]\n  \\usepackage{graphicx}\n  \\usepackage{hyperref}"  
    ("\\section{%s}" . "\\section*{%s}") 
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-export-latex-classes '(
    "ieeetran"
    "\\documentclass[10pt,journal,twoside,cspaper,compsoc]{IEEEtran}\n \[NO-DEFAULT-PACKAGES]\n \[EXTRA]\n  \\usepackage{graphicx}\n  \\usepackage{hyperref}"  
    ("\\section{%s}" . "\\section*{%s}") 
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")      
    ("\\paragraph{%s}" . "\\paragraph*{%s}") 
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-export-latex-classes '(
    "article"
    "\\documentclass[10pt,journal,twoside,cspaper,compsoc]{IEEEtran}\n \[NO-DEFAULT-PACKAGES]\n \[EXTRA]\n  \\usepackage{graphicx}\n  \\usepackage{hyperref}"  
    ("\\section{%s}" . "\\section*{%s}") 
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")      
    ("\\paragraph{%s}" . "\\paragraph*{%s}") 
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-alphabetical-lists t)
(setq org-src-fontify-natively t)
;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images) 
;(add-hook 'org-mode-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-babel-result-hide-all)
(setq org-babel-default-header-args:R '((:session . "org-R")))
(setq org-export-babel-evaluate nil)
(setq org-latex-to-pdf-process '("pdflatex -interaction nonstopmode -output-directory %o %f ; bibtex `basename %f | sed 's/\.tex//'` ; pdflatex -interaction nonstopmode -output-directory  %o %f ; pdflatex -interaction nonstopmode -output-directory %o %f"))
(setq ispell-local-dictionary "american")
(eval (flyspell-mode t))
