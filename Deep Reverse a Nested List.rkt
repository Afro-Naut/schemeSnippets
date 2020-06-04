#lang sicp


(define x (list 1 2 3))
(define y (list 4 5 6))

(define (deep-reverse list)
  (define (iter list reversed-list)
    (cond ((null? list) reversed-list)
          ((pair? (car list)) (iter (cdr list) (cons (deep-reverse (car list)) reversed-list)))
          (else (iter (cdr list) (cons (car list) reversed-list)))))
  (iter list nil))

(define z (list (list 1 2) (list 3 4)))
