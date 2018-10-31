iterlist = []
for line in open('query2.log'):
	if 'early stopping at iteration' in line:
		iternum = int(line.split()[-1])
		iterlist.append(iternum)
print(iterlist)
