; Obfuscated Lisp Script
(defun process-result (result)
  (format t "Processing result: ~A~%" result))

(defun run-script (arg)
  (let ((result arg))
    (process-result result)))

(let ((args (ext:argv)))
  (let ((index (position "./scripts/obfuscated_lisp_script.lisp" args :test 'string=)))
    (if index
        (run-script (elt args (+ index 1)))
        (format t "No arguments provided.~%"))))
