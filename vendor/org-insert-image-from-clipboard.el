(defun org-insert-image-from-clipboard ()
 (interactive)
 (let* ((the-dir (file-name-directory buffer-file-name))
	(attachments-dir (concat the-dir "attachments"))
	(png-file-name (format-time-string "%a%d%b%Y_%H%M%S.png"))
	(png-path (concat attachments-dir "/" png-file-name))
	(cvt-exe-path (concat user-emacs-directory "bins/CbImage2File.exe"))
	(temp-buffer-name "CbImage2File-buffer"))
  (call-process cvt-exe-path nil temp-buffer-name nil png-path)
  (let ((result (with-current-buffer temp-buffer-name (buffer-string))))
   (progn
    (kill-buffer temp-buffer-name)
    (if (string= result "")
     (progn
      (insert (concat "[[./attachments/" png-file-name "]]"))
      (org-display-inline-images))
     (insert result))))))


;;within org-mode, Ctrl-Shift-v key pastes current clipboard to the buffer.
(define-key org-mode-map (kbd "C-S-v") 'org-insert-image-from-clipboard)

;;within markdown-mode, Ctrl-Shift-v key pastes current clipboard to the buffer.
(define-key markdown-mode-map (kbd "C-S-v") 'org-insert-image-from-clipboard)
