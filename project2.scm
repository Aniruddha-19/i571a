;;1

#lang racket

(require (planet dyoo/simply-scheme:1:2/simply-scheme))
(define EMPLOYEES
  '((tom 33 cs 85000.00)
    (joan 23 ece 110000.00)
    (bill 29 cs 69500.00)
    (john 28 me 58200.00)
    (sue 19 cs 22000.00)
    ))
(define (dept-employees dept employees)
(if (not (empty? employees))
(cons ((lambda (c) (if (equal? dept (list-ref c 2)) c '())) (first employees))
(dept-employees dept (rest employees)))
'()))

;;2

(define (dept-employees-names dept employees)
(if (not (empty? employees))
(cons ((lambda (c) (if (equal? dept (list-ref c 2)) (list-ref c 0) '())) (first employees))
(dept-employees dept (rest employees)))
'()
))

;;3

(define (get-item index list)
(list-ref list index))

(define (list-access indexes list)
(every (lambda (c)
(get-item c list)
)
indexes))

;;5

(define (dept-employees-names-salaries dept employees)
(map (lambda (c) (list (list-ref c 0) (list-ref c 3))) (filter (lambda (c) (equal? dept (list-ref c 2))) employees)))

;;6

(define (employees-average-salary employees)
(if (equal? (length employees) 0)
0
(/ (foldl (lambda (elem v) (+ v (list-ref elem 3)))
0
employees) (length employees))
)) 
