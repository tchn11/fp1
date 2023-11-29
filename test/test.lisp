(load "~/quicklisp/setup.lisp")
(load "src/euler15.lisp")
(load "src/euler16.lisp")
(ql:quickload :lisp-unit)

(lisp-unit:define-test slove15_array
    (lisp-unit:assert-equal 137846528820 (solve15array)))

(lisp-unit:define-test slove15_reduce
    (lisp-unit:assert-equal 137846528820 (solve15map_reduce)))

(lisp-unit:define-test sove15_infinte
    (lisp-unit:assert-equal 137846528820 (solve15map_reduce)))

(lisp-unit:define-test slove16
    (lisp-unit:assert-equal 1366 (solve16)))

(lisp-unit:define-test slove16_rec
    (lisp-unit:assert-equal 1366 (solve16rec 0 1)))

(lisp-unit:define-test slove16_reduce
    (lisp-unit:assert-equal 1366 (solve16rec_map_reduce 0 1)))

(lisp-unit:run-tests)

(asdf:load-system :lisp-critic)

(critique-file "src/euler15.lisp")
(critique-file "src/euler16.lisp")
