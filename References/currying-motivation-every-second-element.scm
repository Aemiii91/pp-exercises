(load "c:/Users/Kurt/courses/PP-E21/Auditorium-activities/PP2/REPL-sessions/pp-standard.scm")

(define (every-nth-element n lst)
  (if (shorter-than? n lst)
      (list (car lst))
      (cons (car lst) (every-nth-element n (list-tail lst n)))))

(define (shorter-than? n lst)
  (<= (length lst) n))

(define (shorter-than? n lst)
  (or (and (null? lst) (>= n 0))
      (and (not (null? lst)) (shorter-than? (- n 1) (cdr lst)))))

(every-nth-element 3 '(a b c d e f g h i j))

(define every-second-element (every-nth-element 2))

(define every-second-element
  (lambda (lst)
    (every-nth-element 2 lst)))

(every-second-element '(a b c d e f g h))

(define every-second-element ((curry2 every-nth-element) 2))

every-second-element

(every-second-element '(a b c d e f g h))

"ASSUME THAT every-nth-element USES ANOTHER ORDER OF ITS PARAMETERS..."

(define (every-nth-element lst n)
  (if (shorter-than? n lst)
      (list (car lst))
      (cons (car lst) (every-nth-element (list-tail lst n) n))))

(every-nth-element '(a b c d e f g h i j) 4)

(define every-second-element ((curry2 every-nth-element) 2))

(every-second-element '(a b c d e f g h))

(define every-second-element ((curry2 (flip every-nth-element)) 2))

(every-second-element '(a b c d e f g h))

"DONE - HAPPY CURRYING"

