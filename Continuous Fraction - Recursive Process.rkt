#lang sicp

(define (cont-frac n d k)
  (define (frac-rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (frac-rec (+ i 1))))))
  (frac-rec 1.0))

(define (golden-ratio n)
  (/ 1 (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) n)))
