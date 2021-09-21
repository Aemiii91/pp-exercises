; Write a higher-order function make-comparator, that takes two functions lt (less than) and gt (greater than) as parameters and generates a C-style compare function.

(define (make-comparator lt gt)
    (lambda (x y)
        (cond [(lt x y) -1]
              [(gt x y) 1]
              [else 0])))

(define cmp (make-comparator < >))
(cmp 1 5)
(cmp 5 1)
(cmp 1 1)


; With a little more thought we can generate a C-style compare function from only the function lt. Give it a try.

(define (make-comparator-lt lt)
    (lambda (x y)
        (cond [(lt x y) -1]
              [(lt y x) 1]
              [else 0])))

(define cmp-lt (make-comparator-lt <))
(cmp-lt 1 5)
(cmp-lt 5 1)
(cmp-lt 1 1)


; Use make-comparator and a standard function string<? to generate a function that compares two strings in a C-style (a Scheme version of strcmp).

(define strcmp (make-comparator-lt string<?))
(strcmp "Apple" "apple")
(strcmp "apple" "Apple")


; The other way around, write a higher-order function that takes a C-style compare function and generates a list of functions: lt, equal, gt. Test each of the three generated functions and make sure they work as expected.

(define (gen-comparators cmp)
    (list (lambda (x y) (= -1 (cmp x y)))
          (lambda (x y) (= 0 (cmp x y)))
          (lambda (x y) (= 1 (cmp x y)))))

(define comps (gen-comparators cmp-lt))
(define lt (car comps))
(define equal (cadr comps))
(define gt (caddr comps))