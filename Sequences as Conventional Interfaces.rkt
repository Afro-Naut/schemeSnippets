#lang sicp

(define (accumulate operation initial-value sequence)
  (if (null? sequence)
      initial-value
      (operation (car sequence)
                 (accumulate operation initial-value (cdr sequence)))))

(define (map procedure sequence)
  (accumulate (lambda (x y) (cons (procedure x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (horner-eval x coeffecient-square)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
              0
              coeffecient-square))

(define (flatten tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree)) 
        (else (append (flatten (car tree)) (flatten (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (flatten t))))

(define (square x) (* x x))


(define a (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define c (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define d (list (list 10 11 12) (list 13 14 15) (list 16 17 18)))