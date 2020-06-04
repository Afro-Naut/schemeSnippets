#lang sicp

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? (car tree)))
         (cons (square (car tree)) (square-tree (cdr tree))))
         (else (cons (square-tree (car tree))
                     (square-tree (cdr tree))))))