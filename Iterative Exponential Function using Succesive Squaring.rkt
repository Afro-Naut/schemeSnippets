#lang sicp

(define (fast-exp2 b n)
  (define (exp-iter n b a)
    (cond ((= 0 n) a)
          ((even? n) (exp-iter (/ n 2)
                               (* b b)
                               a))
          (else (exp-iter (- n 1)
                          b
                          (* b a)))))
  (exp-iter n b 1))