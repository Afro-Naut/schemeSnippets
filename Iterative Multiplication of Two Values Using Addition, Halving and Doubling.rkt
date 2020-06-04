#lang sicp

(define (fast* a b)
  (define (double n)
    (+ n n))
  (define (halve n)
    (if (even? n)
        (/ n 2)
        #f))
  (define (fast-iter a b c)
    (cond ((or (= b 0) (= a 0)) c)
          ((even? b) (fast-iter (double a)
                                (halve b)
                                c))
          (else (fast-iter a
                           (- b 1)
                           (+ a c)))))
    (fast-iter a b 0))