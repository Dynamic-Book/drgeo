(new-figure "Base")

(define (triangle p1 p2 p3 n)
  
  (let* ((s1 (Segment "" extremities p1 p2))
	 (s2 (Segment "" extremities p2 p3))
	 (s3 (Segment "" extremities p3 p1))
	 (A  (Point "" on-curve s1 1/10))
	 (B  (Point "" on-curve s2 1/10))
	 (C  (Point "" on-curve s3 1/10)))

	 (send A masked)
	 (send B masked)
	 (send C masked)
	 
	 (if (> n 0)
	     (triangle A B C (- n 1)))))

(lets Point "L" free -5 0) 
(lets Point "M" free  5 0)
(lets Point "N" free  0 ( * 5 (sqrt 3)))

(triangle L M N 30)
