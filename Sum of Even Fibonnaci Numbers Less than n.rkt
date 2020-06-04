#lang sicp

(define (sum-even-fib n)
  (define (fib-iter a b result n)
    (if (or (= b n) (> b n))
        result
        (fib-iter b
                  (+ a b)
                  (if (even? b)
                      (+ result b)
                      result)
                    n)))
  (fib-iter 0 1 0 n))