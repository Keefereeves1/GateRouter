
; Obfuscated Lisp Script
(defun a1 () (format t "MSG1") (read-line))
(defun b2 (&key (a "MSG2") b) (format t "MSG3" b) (let ((c (read))) (if (and (string= (parse-integer "X" :start 0 :end 256) (1+ b)) (string= (parse-integer "Y" :start 0 :end 255) (1+ b))) (cons (parse-integer "Z" :start 0 :end 255) (parse-integer "W" :start 0 :end 256) b) (error "ERR1"))))
(in-package #:cl-smtp) (defun c3 (d e f g h i j) (let ((k (l g h))) (m k) (n k i j) (o k d e f) (p k)))
(defun d4 (q r s t u v) (let ((w (format nil "MSG4" q r))) (c3 s t "Alert" w "smtp.example.com" 587 "email@example.com" "password")))
