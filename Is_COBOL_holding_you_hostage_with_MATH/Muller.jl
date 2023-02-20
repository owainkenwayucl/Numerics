function Recurrence(y, z)
	return (108 - ((815-(1500/z))/y))
end

function Do_Recurrence(n, x)
	for i in 1:n
		push!(x, Recurrence(x[end],x[end-1]))
	end
	return x
end

function Fractions(n)
	x = [big(4)//big(1), big(17)//big(4)]
	return Do_Recurrence(n, x) * 1.0
end

function Floating(n)
	x = [4, 4.25]
	return Do_Recurrence(n, x)
end
