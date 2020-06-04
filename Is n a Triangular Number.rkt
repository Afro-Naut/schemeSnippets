#lang sicp

(define (triangular? n)
  (define (triangular-iter counter test)
    (cond ((> test n) #f)
          ((= n test) #t)
          (else (triangular-iter (+ counter 1)
                                 (+ counter test)))))
  (triangular-iter 2 1))

