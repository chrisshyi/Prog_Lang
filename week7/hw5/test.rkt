#lang racket
(require "hw5.rkt")

(define sum-n
     (eval-exp (fun "sum-n" "n" (ifgreater (var "n") (int 0) (add (var "n") (call (closure '() (var "sum-n")) (add (var "n") (int -1)))) (int 0)))))

(eval-exp (call sum-n (int 2)))