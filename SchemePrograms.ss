;Title:  Homework 2
;Author: Clifford Richardson
;Purpose: Display proficiency in basic scheme and scheme operations
;Date: February 20th, 2018


; #1 Write a recursive Scheme function (subst x y L), which returns a list identical
; to L except that every occurrence of x has been replaced with y.

(define (subst x y L)
	(cond
		((null? L)	'())
		((equal? x (car L)) (append (list y) (subst x y (cdr L))  )) ;if car L is equal to x, then we take y and append the rest of processed L to it
		(else 	(append (list (car L)) (subst x y (cdr L))  ))))
		
		; Yay it works :)

		
; #2 Write a recursive Scheme function (all-different? L), which determines
;whether all elements of list L are distinct (that is, not equal?).	

(define (all-different? L)
	(cond
		((null? L)	#t) 
		((member (car L) (cdr L)) #f) ; look in the rest of the list to see if it exists forward
		(else	(all-different? (cdr L)))))
		
		; Functional as intended, yessir...

		
; #3 

; Suggested functions

(define (right T)
	(car (cdr (cdr T)))) ;I just messed around and ended up with these... I will understand them.  I promise.
		

	
(define (left T)
	(car (cdr T)))


(define (val T)
	(car T))

	
	
;Write a recursive function (n-nodes T), which returns the number of nodes
;in the tree T. 

(define counter 0)

(define (n-nodes T)
	(cond
		((null? T) 0)
		(else (+ 1 (+ (n-nodes(right T)) (n-nodes(left T))))))) ; every node you encounter you add the sum of both sides of the tree and 1
		
	; yes... it finally works!!!


;Write a recursive function (n-leaves T), which returns the number of leaves
;in the tree T. 

(define (n-leaves T)
	(cond
		((null? T) 0)
		((and (null? (right T)) (null? (left T))) 1) ; if both sides are null, then it has to be a leaf
		(else (+ (n-leaves(right T)) (n-leaves(left T)) ))))
		
		; aaaaaand ladies and gentlemennnn, it works!


		
;The height of a tree is defined as the maximum number of nodes on a path from
;the root to a leaf. Write a recursive function (height T), which returns the height of
;the tree T.
	
(define (height T)
	(cond
		((null? T) 0)
		(else (+ 1 (max (height (right T)) (height (left T))))))); by taking the max of either side of the tree we can see which side has the greater 
																 ; value and thus can represent the larger height
		
		; Oh the differences between +1 and + 1... ah well, could have been worse I suppose

		
;Write a recursive function (postorder T), which returns the list of all
;elements in the tree T corresponding to a postorder traversal of the tree.	

(define (postorder T)
	(cond
		((null? T) '())
		(else (append (postorder (left T)) (postorder (right T)) (list (val T))))));pretty self explanatory.
		
	; bingo
	

; Write a recursive Scheme function (flatten L), which takes as arguments a list
;L (possibly containing sublists), and returns a list containing all elements in L and its
;sublists, but all at the same level. 



(define (flatten L)
	(cond
		((null? L) '())
		((list? L) (append (flatten (car L)) (flatten (cdr L)))); tricky one, we have to make sure each element is a list
																; and then proceed to append them all recursively
		(else (list L))))
	
	; perfect

	
;A binary search tree is a binary tree for which the value in each node
;is greater than or equal to all values in its left subtree, and less than all values in its right
;subtree. The binary tree given as example in problem 3 also qualifies as a binary search tree.
;Using the same list representation, write a recursive function (member-bst? V T),
;which determines whether V appears as an element in the binary search tree T. Make sure
;you actually use binary search.

(define (member-bst? V T)
	(cond
		((null? T) #f)
		((= V (val T)) #t)
		((> V (val T)) (member-bst? V (right T))) ;What more can I say than that Dr. Harris taught me this well. 
		((< V (val T)) (member-bst? V (left T)))
		(else #f)))
		
		; immaculate
	



 (define T
	'(13
		(5
			(1 () ())
			(8 ()
				(9 () ())))
		(22
			(17 () ())
			(25 () ())))) 