#lang racket
(require berkeley)

;(define (product term a next b) 
;    (if (> a b)
;	1
;	(* (term a) (product term (next a) next b))
;        )
;     )
;
;(define (factorial n) 
;  (if (= n 0)
;      1
;      (* n (factorial (- n 1)))
;  )
;  )
; 
;
;(define (sum term a next b)
;(if (> a b)
;    0
;    (+ (term a)
;       (sum term (next a) next b)))
;)
;
;(define (cube x) (* x x x))
;
;(define (inc n) (+ n 1))
;
;(define (sum-cubes a b) (sum cube a inc b))
;
;;(sum-cubes 1 10)
;
;(product factorial 2 inc 5)
;
;
;(define (accumulate combiner null-value term a next b)
;(if (> a b)
;null-value
;(combiner (term a) (accumulate combiner null-value term (next a) next b)) )
;)
;
;
;;(accumulate sum 0 cube 1 inc 10)
;(accumulate * 1 factorial 2 inc 5)
;
;
;(define (filtered-accumulate filter combiner null-value term a next b)
;(cond ((> a b) null-value)
;      ((filter a)
;       (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b)))
;      (else (filtered-accumulate filter combiner null-value term (next a) next b))           
;)
;)
;
;
;;(define (prime? n)
;;  ;if n / n -1 all the way to 1 has a remainder, it's a prime
;;  (cond ((= n 1))
;;  (not ( (remainder n (prime? (- n 1))) 0))
;;  (else #f)
;;  )
;;)
;
;;(prime? 3)
;
;; Ex 1.40
;; newton's method takes in procedure and starting guess 
;(define (cubic a b c)
;  (lambda (x) (+ (expt x 3) (expt (* a x) 2) (* b x) (c)))
;  )
;
;;Ex 1.41
;(define (double procedure x)
;  (procedure(procedure x))
;  )
;
;;Qn: What value is returned by (((double (double double))inc)5)?
;;Ans: 8 times of inc + 5 = 13
;
;Ex 1.42
(define (square x) (* x x))

(define (compose prod1 prod2)
  (lambda (x) (prod1(prod2 x)))
  )

((compose square inc) 6)

;Ex 1.43
;(define (repeated prod times)
;  (lambda (x) (
;               (if (= times 0)
;                   x
;                   ((compose prod (repeated prod (- times 1))) x)
;                  )
;               )
;   )
;)

(define (repeated prod times)
                 (if (= times 0)
                   (lambda (x) (x))
                   ((compose prod (repeated prod (- times 1))))
                  )


  )
((repeated square 2) 5)


;Ex 1.7
(define (iterative-improve good-enough? improve-guess)
  (lambda (guess x) (
               (if (good-enough? guess x)
                   guess
                   ((iterative-improve good-enough? improve-guess) (improve-guess guess x) x)
               )
             )
   )
  )
;
;
;;Square rooting
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square-iter guess x)
         ((iterative-improve good-enough? improve) guess x)
         )

(square-iter 0.1 9)

;Fixed point
(define tolerance 0.00001)

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance)
  )

(define (try guess f)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

(define (fixed-point f first-guess)
    ((iterative-improve close-enough? try) first-guess (f first-guess))
)

(fixed-point cos 1.0)