(require 'xterm-color)

(defcustom wttr-city-names '("London" "Milton Keynes" "Paris")
  "A list of city names that can be chosen from with `wttr'.")

(defun wttr-request (city-name)
  (let ((request-url (concat "http://wttr.in/" city-name))
	(url-request-extra-headers '(("User-Agent" . "curl"))))
    (with-current-buffer (url-retrieve-synchronously request-url)
      (goto-char (1+ url-http-end-of-headers))
      (decode-coding-string (buffer-substring (point) (point-max)) 'utf-8))))

(defun wttr ()
  (interactive)
  (let ((city-name (completing-read "City name: " wttr-city-names))
	(response (wttr-request city-name)))
    (switch-to-buffer "*wttr*")
    (setq buffer-read-only t)
    (erase-buffer)
    (insert (xterm-color-filter response))))

(provide 'wttr)
