#lang sicp

(define (repeated f n)
  (if (= 1 n)
      f
      (repeated (f f) (- n 1))))

(define (square x)
  (* x x))

