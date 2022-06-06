#lang racket
(require berkeley)
;(define (squares sent)
;		(if (empty? sent)
;		'()
;                (se (* (first sent) (first sent))
;		(squares (bf sent)))))
;(squares '(2 3 4 5))

;(define (switch sent)
;  (if (equal? (first sent) 'You)
;      (se 'I (substitute(bf sent)))
;      (substitute sent))
;)
;  
;(define (substitute sent)
;  (define (change word)
;    (cond ((or (equal? word 'I)(equal? word 'me)) 'you)
;       ((equal? word 'you)'me)
;       (else word)))
;  (if (empty? sent)
;      '()
;      (se (change (first sent))
;          (substitute(bf sent))))
;  )
;
;(switch '(You told me that I should wake you up))


;(define (ordered? sent)
;  (cond ((=(count sent) 1) #t)
;        ((>= (first sent) (item 2 sent)) #f)
;        (else (ordered? (bf sent)))
;  )
;  )
;
;
;(ordered? '(a))

;(define (ends-e sent)
;  (cond ((empty? sent)'())
;        ((equal? (last (first sent)) 'e)(se (first sent) (ends-e (bf sent))))
;        (else (ends-e (bf sent)))
;  )   
;)
;
;(ends-e '(please put the salami above the blue elephant))


;(define (test-and)
;  (if (and((= 3 3)(= 4 3)))
;      ('special)
;      ('ordinary))
;  )
;
;(define (test-or)
;  (if (or((= 3 3)(= 4 3)))
;      ('special)
;      ('ordinary))
;  )
;
;(test-and)
(define (test-and)
  (if (and(#t #f))
      ('special)
      ('ordinary))
  )

(test-and)