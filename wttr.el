(require 'xterm-color)

(defgroup wttr nil
  "Emacs client for wttr.in.")

(defcustom wttr-location-names '("London" "Milton Keynes" "Paris")
  "A list of location names that can be chosen from with `wttr'."
  :group 'wttr)

(defcustom wttr-language "en"
  "The language code to be used in responses."
  :group 'wttr)

(defun wttr-request (path)
  (let ((request-url (format "http://wttr.in/%s?A&lang=%s" path wttr-language)))
    (with-current-buffer (url-retrieve-synchronously request-url)
      (goto-char (1+ url-http-end-of-headers))
      (decode-coding-string (buffer-substring (point) (point-max)) 'utf-8))))

(defun wttr-show (path)
  (let ((response (wttr-request path))
	(inhibit-read-only t))
    (switch-to-buffer "*wttr*")
    (setq buffer-read-only t)
    (erase-buffer)
    (insert (xterm-color-filter response))))

(defun wttr-moon ()
  (interactive)
  (wttr-show "moon"))

(defun wttr ()
  (interactive)
  (wttr-show (completing-read "Location name: " wttr-location-names)))

(provide 'wttr)
