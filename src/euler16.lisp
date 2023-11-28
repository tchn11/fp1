(defun solve16 ()
  (let ((num 1))
    (dotimes (i 1000)
      (setf num (* 2 num)))

    (let ((sum 0))
      (dotimes (i (length (write-to-string num)))
        (setf sum (+ sum (digit-char-p (char (write-to-string num) i)))))
      sum)))

(defun solve16rec (n prev)
  (if (< n 1000)
      (solve16rec (+ n 1) (* prev 2))
    (let ((sum 0))
      (dotimes (i (length (write-to-string prev)))
	(setf sum (+ sum (digit-char-p (char (write-to-string prev) i)))))
      sum)))

(defun solve16rec_map_reduce (n prev)
  (if (< n 1000)
      (solve16rec_map_reduce (+ n 1) (* prev 2))
    (reduce #'+ (mapcar #'(lambda (x) (digit-char-p x)) (coerce (write-to-string prev) 'list)))))
