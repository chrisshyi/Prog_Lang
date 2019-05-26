
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

;; put your code below

