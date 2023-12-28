(new-figure "General")

(define (carre p1 p2 p3 p4 n)
  
  (let* ((s1 (Segment "" extremities p1 p2))
	 (s2 (Segment "" extremities p2 p3))
	 (s3 (Segment "" extremities p3 p4))
	 (s4 (Segment "" extremities p4 p1))
	 (A  (Point "" on-curve s1 1/10))
	 (B  (Point "" on-curve s2 1/10))
	 (C  (Point "" on-curve s3 1/10))
	 (D  (Point "" on-curve s4 1/10)))

	 (send A masked)
	 (send B masked)
	 (send C masked)
	 (send D masked)
	 
	 (if (> n 0)
	     
	     (carre A B C D (- n 1)))))

(lets Point "A" free  5  5) 
(lets Point "B" free -5  5)
(lets Point "C" free -5 -5)
(lets Point "D" free  5 -5)

(carre A B C D 30)
