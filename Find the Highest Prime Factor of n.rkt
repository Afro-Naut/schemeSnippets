#lang sicp

(define (highest-prime-factor n)
  (define (square x) (* x x))
  (define (divides? a b) (= (remainder b a) 0))
  (define (iter test-value highest n)
    (cond ((> (square test-value) n)
           (if (> n highest)
               n
               highest))
          ((divides? test-value n)
           (if (> test-value highest)
               (iter 2 test-value (/ n test-value))
               (iter 2 highest (/ n test-value))))
          (else (iter (+ test-value 1) highest n))))
  (iter 2 0 n))