(define (increasing-list? rel-pred lst)
  (if (or (null? lst) (null? (cdr lst)))
      #t
      (and (rel-pred (car lst) (cadr lst))
           (increasing-list? rel-pred (cdr lst)))))

(define (number-interval a b)
  (if (> a b)
      '()
      (cons a (number-interval (+ a 1) b))))


(define (number-interval a b)
  (number-interval-iter a b b '()))

(define (number-interval-iter a b i result)
  (if (< i a)
      result
      (number-interval-iter a b (- i 1) (cons i result))))
