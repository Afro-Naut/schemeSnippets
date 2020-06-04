#lang sicp

(define (pascal-row n)
  (define (row-iter row count reset-counter)
    (cond ((= n count) row)
          ((= row reset-counter) (row-iter (+ row 1)
                                          (+ count 1)
                                          1))
          (else (row-iter row
                          (+ count 1)
                          (+ reset-counter 1)))))
  (row-iter 1 1 1))
