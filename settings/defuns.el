;; Most of this was stolen from Isaac Azuelos

;; Normal Em and En Dashes
(defun insert-em-dash ()
  "Insert a proper Unicode em-dash."
  (interactive)
  (insert "—"))

(defun insert-en-dash ()
  "Insert a proper Unicode en-dash."
  (interactive)
  (insert "–"))

;; Kill line 
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; Textmate-like commenting
;; From http://stackoverflow.com/questions/9688748/
(defun comment-or-uncomment-region-or-line ()
  "Like Textmate's Command-/"
  (interactive)
  (let (start end)
    (if (region-active-p)
        (setq start (region-beginning)
              end   (region-end))
      (setq start (line-beginning-position)
	    end   (line-end-position)))
    (comment-or-uncomment-region start end)))

;; Kill Buffer Volatile
(defun kill-this-buffer-volatile ()
  "kill the current buffer without confirmation, only if saved."
  (interactive)
  (when (not (buffer-modified-p))
    (kill-buffer (current-buffer))))

(defun new-empty-frame ()
  "Create a new window with a blank untitled buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

;; Edit host file as root
(defun hosts ()
  "Open /etc/hosts as root."
  (interactive)
  (find-file "/sudo::/etc/hosts"))

(provide 'defuns)
