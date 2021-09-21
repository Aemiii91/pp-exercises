; Write a function, every-second-element, that returns every second element of a list. As examples

;   (every-second-element '(a b c)) => (a c)
;   (every-second-element '(a b c d)) => (a c)
; Do you see any use of this function when we work with property lists?

; It is often worthwhile to go for a more general solution than actually needed. Therefore, program (every-nth-element n lst) where n >= 1 and lst is a proper list.

; Can you define every-second-element in terms of every-nth-element?

; Return every n-th element of lst. Assume as a pre-condition that n >= 1.
(define (every-nth-element n lst)
  (cond ((null? lst) '())
        ((< (length lst) n) (list (car lst)))
        (else (cons (car lst) (every-nth-element n (list-tail lst n))))))

(define (every-second-element lst)
  (every-nth-element 2 lst))
