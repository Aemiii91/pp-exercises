(define (get-prop key property-list)
    (let ((idx (index key property-list)))
        (if (< idx 0)
            #f
            (+ 1 (/ idx 2)))))
        
(define (index el lst)
    (if (null? lst)
        -inf.0
        (if (equal? (car lst) el) 0 (+ 1 (index el (cdr lst))))))

(define weekday-plist (list 'monday 1 'tuesday 2 'wednesday 3 'thursday 4 'friday 5 'saturday 6 'sunday 7))
(get-prop 'wednesday weekday-plist)
(get-prop 'sunday weekday-plist)
(get-prop 'january weekday-plist)