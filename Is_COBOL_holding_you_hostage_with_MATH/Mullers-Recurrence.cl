; Muller's Recurrence for Common Lisp.
; This shows the immense superiority of Common Lisp's
; default "Numbers are factions" format as the algorthm
; never breaks.

(defun Recurrence (y z)
	(- 108 (/ (- 815 (/ 1500 z)) y))
)

(defun Do-Recurrence (n x)
	(loop for i from 1 to n do
		(setq x (append x (list (Recurrence (car (last x)) (car (last x 2))))))
	)
	x
)

; The "Fractional version" does all the math as fractions
; and converts to float for output.
(defun Fraction (n)
	(let ((x '(4 17/4)))
	(loop for g in (Do-Recurrence n x) collect (* 1.0 g)))
)

; The float version uses (single precision) floats from
; the start.
(defun Floating (n)
	(let  ((x '(4.0 4.25)))
	(Do-Recurrence n x))
)

(defun Compare (n) 
	(format t " i    | Floating Point       | Fraction (->fp out) ~%")
	(format  t"---------------------------------------------------~%")
	(let ((frs (Fraction n))
	      (fls (Floating n)))
		(loop for i from -1 to n do
			(format t " ~4a | ~20f | ~20f~%" i (pop fls) (pop frs))
		)
	)
)

(Compare 20)
