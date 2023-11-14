;рекурсией
(defun solve15 (a b)
    (if (and (> a 0) (> b 0))
        (return-from solve15 (+ (solve15 (- a 1) b) (solve15 a (- b 1))))
        (if (and (= a 0) (> b 0))
            (return-from solve15 (solve15 a (- b 1)))
            (if (and (> a 0) (= b 0))
                (return-from solve15 (solve15 (- a 1) b))
                (return-from solve15 1)))))

; лоб через циклы
(defun solve15array ()
    (let ((df (make-array '(21 21))))
    (setf (aref df 0 0) 1)
    (dotimes (i 21)
        (dotimes (j 21)
            (if (> i 0) (setf (aref df i j) (+ (aref df (- i 1) j) (aref df i j))))
            (if (> j 0) (setf (aref df i j) (+ (aref df i (- j 1)) (aref df i j))))))
    (aref df 20 20)))

;map, reduce и генератор
(defun solve15map_reduce ()
    (reduce #'* (mapcar #'(lambda(x) (/ (+ 20 x) x )) (loop for i from 1 to 20 collect i))))