1. (define (product func lower_bound upper_bound) 
    (if (= lower_bound upper_bound)
	0
	(* func(lower_bound) (product func (lower_bound + 1)))
        )
     )
(define (factorial n) 
  (if (= n 0)
      1
      (* n (factorial (n - 1)))
  )
  )

2. (define (accumulate combiner null-value term a next b)
(if (> a b)
null-value
(accumulate(combiner(term a next b)))
)
)


define sum....
define product....

(accumulate sum 0 cubes 1 next b)
(accumulate product 1 factorial a next b)