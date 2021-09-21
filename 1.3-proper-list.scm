(define (proper-list? lst)
  (or (null? lst)
      (and (pair? lst) (proper-list? (cdr lst)))))

(define (proper-list-if? lst)
    (if (null? lst)
        #t
        (if (pair? lst)
            (proper-list-if? (cdr lst))
            #f)))
