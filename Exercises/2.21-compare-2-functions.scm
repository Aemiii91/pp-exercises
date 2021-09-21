; Based on the derivative function:
; f'(x) = (f(x + h) - f(x)) / h
(define (derivative f)
  (lambda (x)
    (let ((h 0.000001))
      (/ (- (f (+ x h)) (f x)) h))))

; tail-recursive power function
(define (pow a b)
  (let pow-h [(b b) (result 1)]
    (if (= b 0)
        result
        (pow-h (- b 1) (* result a)))))

(define func1 (derivative (lambda (x) (pow x 5))))
(map func1 '(1.0 2.0 3.0 4.0 5.0))

(define func2 (lambda (x) (* 5 (pow x 4))))
(map func2 '(1.0 2.0 3.0 4.0 5.0))


; Write a function compare-2-functions
;
;    (compare-2-functions f1 f2 numerical-input-list)
;
; which applies f1 and f2 on elements in numerical-input-list,
; and outputs a list of differences between f1(x) and f2(x) for x
; in numerical-input-list. Use compare-2-functions to compare
; (derivative f) and f'.
(define (compare-2-functions f1 f2 numerical-input-list)
    (let [(lst1 (map f1 numerical-input-list))
          (lst2 (map f2 numerical-input-list))]
        (map abs (map - lst1 lst2))))

(compare-2-functions func1 func2 '(1.0 2.0 3.0 4.0 5.0))
