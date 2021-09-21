(define (my-list-tail lst n)
    (if (= n 0)
        lst
        (my-list-tail (cdr lst) (- n 1))))

(list-tail '(a b c d e)  2)
; (c d e)
(list-tail '(a b c d e)  0)
; (a b c d e)
(list-tail '(a b c d e)  4)
; (e)

(define (list-prefix lst n)
    (if (= n 0)
        '()
        (cons (car lst) (list-prefix (cdr lst) (- n 1)))))

(list-prefix '(a b c d e)  2)
; (a b)
(list-prefix '(a b c d e)  4)
; (a b c d)
(list-prefix '(a b c d e)  0)
; ()
