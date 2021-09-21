(load "c:/Users/Kurt/courses/PP-E21/Auditorium-activities/PP2/REPL-sessions/pp-standard.scm")

(define (f a b c d)
  (+ a b c d))

(f 1 2 3 4)
(f 1 2)

(define g (curry4 f))
(define g (curry f 4))

(g 1 2 3 4)
(g 1 2)
(g 1)
((g 1) 2)
(((g 1) 2) 3)
((((g 1) 2) 3) 4)

(define (curry-generalized f number-of-formal-parameters-of-f)
 (lambda actual-parameters
   (cond ((< (length actual-parameters) number-of-formal-parameters-of-f)
          (lambda next-pars
            (apply 
             (curry-generalized f number-of-formal-parameters-of-f)
             (append actual-parameters next-pars))))
         ((= (length actual-parameters) number-of-formal-parameters-of-f)
          (apply f actual-parameters))
         (else (error "Too many parameters to f")))))

(define h (curry-generalized f 4))
(h 1 2 3 4)
(h 1 2 3 4 5)
(h 1 2 3)
((h 1 2 3) 4)
((((h 1) 2) 3) 4)
(((h 1 2) 3) 4)
((h 1 2) 3 4)



"THE HAPPY END"