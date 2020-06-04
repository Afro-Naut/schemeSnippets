#lang sicp

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (length branch)
  (if (number? (branch-structure branch))
      0
      (+ (branch-length branch) (length (branch-structure branch)))))

(define (total-weight mobile)
  (+ (length (left-branch mobile)) (length (right-branch mobile))))

(define (weight branch)
  (if (number? (branch-structure branch))
      (branch-structure branch)
      (weight (branch-structure branch))))

(define (torque branch)
  (* (length branch) (weight branch)))

(define (balanced? mobile)
  (= (torque (left-branch mobile)) (torque (right-branch mobile))))







