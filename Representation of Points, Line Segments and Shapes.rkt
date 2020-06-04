#lang sicp

(define (square x) (* x x))

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define (make-segment starting-point ending-point)
  (cons starting-point ending-point))

(define (starting-point line-segment)
  (car line-segment))

(define (ending-point line-segment)
  (cdr line-segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint line-segment)
  (make-point (/ (+ (x-point (starting-point line-segment))
                    (x-point (ending-point line-segment)))
                 2)
              (/ (+ (y-point (starting-point line-segment))
                    (y-point (ending-point line-segment)))
                 2)))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (gradient line-segment)
  (/ (- (y-point (ending-point line-segment)) (y-point (starting-point line-segment)))
     (- (x-point (ending-point line-segment)) (x-point (starting-point line-segment)))))

(define (make-rect length breadth)
  (if (= (* (gradient length) (gradient breadth)) -1)
      (cons length breadth)
      (error "line segments are not perpendicular")))

(define (length rect)
  (car rect))

(define (breadth rect)
  (cdr rect))

(define (segment-length line-segment)
  (sqrt (+ (square (- (x-point (ending-point line-segment)) (x-point (starting-point line-segment))))
           (square (- (y-point (ending-point line-segment)) (y-point (starting-point line-segment)))))))

(define (perimeter-rect rect)
  (+ (* 2 (segment-length (length rect)))
     (* 2 (segment-length (breadth rect)))))

(define (area-rect rect)
  (* (segment-length (length rect)) (segment-length (breadth rect))))
                      

(define a (make-point 2 4))
(define b (make-point 16 32))
(define ab (make-segment a b))
(define mid-ab (midpoint ab))
(define grad-ab (gradient ab))
(define c (make-point 0 40))
(define bc (make-segment b c))
(define grad-ac (gradient bc))
(define rect1 (make-rect ab bc))



