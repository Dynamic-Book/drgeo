(new-figure "Send")

(lets Point "A" free 1 0)
(lets Point "B" free 2 0)
(lets Point "C" free 2 0)

(lets Line "d1" 2points A B)

(send A color yellow)
(send A shape round)
(send A size large)

(send B color green)

(send C masked)

(send d1 thickness dashed)
