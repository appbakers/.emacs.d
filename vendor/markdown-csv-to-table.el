;; NOTE: Don't use this use Org Mode - and export to MarkDown :D
;; This is just a simple demonstration to give you a look at emacslisp... 

;; always remember C-h f to lookup a function, C-h v to lookup a variable

(require 's) ;; M-x package-install <RETURN> s <RETURN>

(defun markdown--csv-to-table (csv)
 "Turn a CSV into a markdown table."
 (string-join ;; this will happen last, join everything up and return it to the caller.
  (mapcar ;; walk through the lines in the CSV selection.
   (lambda (line) ;; in each line...
    (setq line (format "| %s |" line)) ;; place | pipes at the start and end of the line.
    (s-replace "," " | " line)) ;; replace commas with | pipes
   (split-string (s-chomp csv) "\n")) "\n")) ;; This is acutally happening at the start, we split CSV at newlines

(defun markdown-csv-to-table (begin end)
 (interactive "r") ;; get the region using the (interactive) macro.
 (unless (region-active-p) ;; Abort when there's no region selected.
  (error "csv text region must be selected"))
 (let ((table (markdown--csv-to-table (buffer-substring begin end)))) ;; use the function above to make the actual table
  (save-excursion ;; return to the same position after running the next command...
   (delete-region begin end)) ;; delete the original text
  (insert table))) ;; insert the markdown table
