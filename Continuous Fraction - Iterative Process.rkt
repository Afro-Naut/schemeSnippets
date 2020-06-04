#lang sicp

(define (cont-frac n d k)
  (define (iter k result)
    (if (= 0 k)
        result
        (iter (- k 1)
              (/ (n k)
                 (+ (d k) result)))))
    (iter k 0))

(define (golden-ratio x)
  (/ 1 (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) x)))
        
(define (e n)
  (+ 2 (cont-frac (lambda (x) 1.0)
                  (lambda (x) (cond ((= x 2) 2)
                                    ((= (remainder (- x 2) 3) 0) (+ (* 2 (/ (- x 2) 3))))
                                    (else 1)))
                  n)))
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (-(* x x))))
             (lambda (i) (if (= i 1)
                             1
                             (+ i (- i 1))))
             k))

