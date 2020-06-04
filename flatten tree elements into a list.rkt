#lang sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (leaf? item)
  (if (not (pair? item))
      #t
      #f))

(define (fringe tree)
  (cond ((null? tree) nil)
        ((leaf? (car tree)) (cons (car tree) (fringe (cdr tree))))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))