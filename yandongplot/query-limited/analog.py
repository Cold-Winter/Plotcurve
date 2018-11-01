iterlist = []
for line in open('therm_608_600.log'):
	if 'early stopping at iteration' in line:
		iternum = int(line.split()[-1])
		iterlist.append(iternum)
print(iterlist)
