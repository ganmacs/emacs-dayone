;;; emacs-dayone -- save text as dayone

;; Copyright (C) 2013-2014 ganmacs

;; Author: ganmacs <ganmacs_at_gmail.com>
;; Maintainer: ganmacs <ganmacs_at_gmail.com>
;; URL:
;; Version: 0.0.1
;; Keywords: dayone

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defvar emacs-dayone-cmd "/usr/local/bin/dayone new")
(defvar emacs-dayone-succes-reg "^New entry :")

;;;###autoload
(defun emacs-dayone/save ()
  "Run dayone command"
  (interactive)
  (let* ((start (point-min))
         (end   (point-max))
         (contents (buffer-substring start end))
         (tmp-file (make-temp-file "emacs-dayone"))
         (cmd (format "%s < %s" emacs-dayone-cmd tmp-file)))
    (with-temp-file tmp-file (insert contents))
    (if (string-match emacs-dayone-succes-reg
                      (shell-command-to-string cmd))
        (message "Success: contents saved")
        (message "Failed: can't saved"))
    (delete-file tmp-file)))

(provide 'emacs-dayone)
;;; emacs-dayone.el ends here
