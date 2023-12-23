| triangle c |
c _ DrGeoSketch new.
triangle _ [].

triangle _ [:s1 :s2 :s3 :n |
    c segment: s1 to: s2;
        segment: s2 to: s3;
        segment: s3 to: s1.
    n >0 ifTrue:
        [triangle
            value: s1
            value: (c middleOf: s1 and: s2) hide
            value: (c middleOf: s1 and: s3) hide
            value: n-1.
        triangle
            value: (c middleOf: s1 and: s2) hide
            value: s2
            value: (c middleOf: s2 and: s3) hide
            value: n-1.
        triangle
            value: (c middleOf: s1 and: s3) hide
            value: (c middleOf: s2 and: s3) hide
            value: s3
            value: n-1.]].
triangle
    value: 0@3
    value:  4@ -3
    value: -4@ -3
    value: 3.
(c point: 0@3) show