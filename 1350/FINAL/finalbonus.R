#FINALBONUS

#exp.model = nls(cases~A*exp(B*dates), start=list(A = 1, B = 0.5)
A = coef(exp.model)[["A"]]
B = coef(exp.model)[["B"]]

x = dates
y = A*exp(B*dates)

lines(x, y, type="l", col = "red")

#cases will reach 100,000 when?
#solve 100,000 = A*exp(B*dates)
x = log(100000/A)/B