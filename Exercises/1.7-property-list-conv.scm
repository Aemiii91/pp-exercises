(define (asslist=>proplist a-lst)
    (cond ((null? a-lst) '())
          ((= (length a-lst) 0) a-lst)
          (else (cons (caar a-lst) (cons (cdar a-lst) (asslist=>proplist (cdr a-lst)))))))

(define (proplist=>asslist p-lst)
    (cond ((null? p-lst) '())
        ((= (length p-lst) 2) (list (cons (car p-lst) (cadr p-lst))))
        (else (cons (cons (car p-lst) (cadr p-lst)) (proplist=>asslist (cddr p-lst))))))
