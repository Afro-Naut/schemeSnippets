#lang sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map proc (cdr items)))))

(define (square-tree tree)
  (map (lambda (x)
         (cond ((null? x) nil)
               ((not (pair? x)) (* x x))
               (else (square-tree x))))
       tree))

