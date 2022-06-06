1) The square-root program will still have the same output when using new-if, as new-if and if are the same functions with different procedures. **Wrong**
>new-if is a procedure that uses applicative order of evaluation, which means that the sqrt-iter procedure will be evaluated recursively at each new-if invocation, causing an infinite loop for sqrt-iter

3) (define (squares sent)
		(if (empty? sent)
		'()
		(se '(first sent * first sent)
		'(squares (bf sent)))))
3) (define (switch sent)
  (if (equal? (first sent) 'you)
      (substitute(se 'I '(bf sent)))
      (substitute sent))
)
  
(define (substitute sent)
  (if (empty? sent)
      '()
      (se '(cond ((or (equal? wd 'I)(equal? wd 'me)) 'you)
       ((equal? wd 'you)'me))
          'substitute(bf sent))))
          
4) (define (ordered? sent)
  (cond ((=(count sent) 1) #t)
        ((first sent >= (item 2 sent)) #f)
        (ordered? (bf sent))))
5) (define (ends-e sent)
  (cond ((empty? sent)'())
        ((equal? (last (first sent)) 'e)(se '(first sent) (ends-e (bf sent))))
        (else (ends-e (bf sent)))
  )   
)

6) (define (test-and)
  (if (and((= 3 3)(= 4 3)))
      ('special)
      ('ordinary))
  )

(define (test-or)
  (if (or((= 3 3)(= 4 3)))
      ('special)
      ('ordinary))
  )

It is advantageous to treat `or` as a special form when there are many argument expressions, and only a single `True` is required from one of the expression, since this will save computation cost from evaluating all the argument expressions. 

It is advantageous to treat `or`  as an ordinary function when  it is important to know the validity of all argument expressions, especially when there may be invalid expressions that are being passed to the `or` function after the expression that is `True` 

----
*Questions*
How to do recursion when i only want to run recursively after the first iteration

