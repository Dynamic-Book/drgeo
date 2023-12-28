(define (triangle p1 p2 p3)

  (Segment "" extremities p1 p2)
  (Segment "" extremities p2 p3)
  (Segment "" extremities p1 p3))

(define (rand) 

  (- 8 (* 16 (random:uniform))))

(new-figure "Exemple")

(lets Point "A" free (rand) 0)
(lets Point "B" free 5 0)
(lets Point "C" free (rand) 5)

(triangle A B C)
