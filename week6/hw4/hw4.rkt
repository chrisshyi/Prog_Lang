
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (str) (string-append str suffix)) xs))

(define (list-nth-mod xs n)
  (if (< n 0) (error "list-nth-mod: negative number")
      (if (null? xs) (error "list-nth-mod: empty list")
          (let ([n-mod-len (remainder n (length xs))]) (car (list-tail xs n-mod-len))))))

(define (stream-for-n-steps s n)
  (if (= n 0) null
      (let ([eval-thunk (s)]) (cons (car eval-thunk) (stream-for-n-steps (cdr eval-thunk) (- n 1))))))

(define funny-number-stream
  (letrec ([helper (lambda (x) (if (= (remainder x 5) 0) (- x) x))]
        [helper2 (lambda (x) (cons (helper x) (lambda() (helper2 (+ x 1)))))]) (lambda () (helper2 1))))

;; put your code below


(define dan-then-dog (letrec ([dog-thunk (lambda () (cons "dog.jpg" dan-thunk))]
                              [dan-thunk (lambda () (cons "dan.jpg" dog-thunk))]) dan-thunk))

(define (stream-add-zero s) (lambda () (cons (cons 0 (car (s))) (stream-add-zero (cdr (s))))))

(define (cycle-lists xs ys) (letrec ([helper (lambda (n) (cons (cons (list-nth-mod xs n) (list-nth-mod ys n)) (lambda () (helper (+ n 1)))))])
  (lambda () (helper 0))))

(define (vector-assoc v vec) (letrec ([helper (lambda (v vec index)
                                             (cond [(= index (vector-length vec)) #f]
                                                                       [(not (pair? (vector-ref vec index))) (helper v vec (+ index 1))]
                                                                       [(equal? (car (vector-ref vec index)) v) (vector-ref vec index)]
                                                                       [#t (helper v vec (+ index 1))]))])
                               (helper v vec 0)))

(define (cached-assoc xs n) (letrec ([cache (make-vector n #f)]
                                     [next-slot 0]
                                     [assoc-with-cache (lambda (v) (let ([cache-lookup (vector-assoc v cache)])
                                                                        (if (not cache-lookup) ; not found in cache
                                                                            (let ([list-lookup (assoc v xs)])
                                                                              (if (not list-lookup) ; not in list either
                                                                                  #f
                                                                                  (begin (vector-set! cache next-slot list-lookup)
                                                                                         (set! next-slot (modulo (+ next-slot 1) n))
                                                                                         list-lookup)))
                                                                            cache-lookup)))])
                              assoc-with-cache))

