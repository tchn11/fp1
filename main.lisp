(load "~/quicklisp/setup.lisp")
(ql:quickload :lisp-unit)
(in-package :lisp-unit)


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

(defun solve16 ()
    (let ((num 1))
    (dotimes (i 1000)
        (setq num (* 2 num)))
    
    (let ((sum 0))
    (dotimes (i (length (write-to-string num)))
        (setq sum (+ sum (digit-char-p (char (write-to-string num) i)))))
    sum)))

(defun solve16rec (n prev)
    (if (< n 1000) 
        (return-from solve16rec (solve16rec (+ n 1) (* prev 2)))
        (let ((sum 0))
            (dotimes (i (length (write-to-string prev)))
                (setq sum (+ sum (digit-char-p (char (write-to-string prev) i)))))
            (return-from solve16rec sum))))

(defun solve16rec_map_reduce (n prev)
    (if (< n 1000) 
        (return-from solve16rec_map_reduce (solve16rec_map_reduce (+ n 1) (* prev 2)))
        (return-from solve16rec_map_reduce (reduce #'+ (mapcar #'(lambda (x) (digit-char-p x)) (coerce (write-to-string prev) 'list))))))

(define-test slove15_array
    (assert-equal 137846528820 (solve15array)))

(define-test slove15_reduce
    (assert-equal 137846528820 (solve15map_reduce)))

(define-test slove16
    (assert-equal 1366 (solve16)))

(define-test slove16_rec
    (assert-equal 1366 (solve16rec 0 1)))

(define-test slove16_reduce
    (assert-equal 1366 (solve16rec_map_reduce 0 1)))

(run-tests)
