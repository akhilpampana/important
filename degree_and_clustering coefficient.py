from matplotlib import pyplot as plt

flag = 0
prodict = {}
dictdegree = {}
increment = 0
pincrement = 0
dincrement = 0
increase = 0

with open("Human-PPI.txt", "r") as f:
	for line in f:
		if flag == 1:
			words=line.split("\t")
			pro1=words[0].rstrip()
			pro2=words[1].rstrip()
			#print (pro1)
			#print (pro2)
			if pro1 in prodict:
				prodict[pro1][0] = prodict[pro1][0] + 1 
				prodict[pro1].append(pro2)
			else:
				prodict[pro1] = [1]
				prodict[pro1].append(pro2)
			if pro2 in prodict:
				prodict[pro2][0] = prodict[pro2][0] + 1 
				prodict[pro2].append(pro1)
			else:
				prodict[pro2] = [1]
				prodict[pro2].append(pro1)
		flag = 1
f.close()

degree = open('degree.txt', 'w')
for key in prodict:
	degree.write(key + "\t" + str(prodict[key][0]) + "\n")
degree.close()

f1 = open('plist1.txt','w')

with open("protein-list1.txt", "r") as f:
	for line in f:
		protein=line.rstrip()
		if protein in prodict:
			for i in range(1,len(prodict[protein])):
				f1.write(protein + "\t" + prodict[protein][i] + "\n")
f1.close()
f.close()

f2 = open('plist2.txt','w')

with open("protein-list2.txt", "r") as f:
	for line in f:
		protein=line.rstrip()
		if protein in prodict:
			for i in range(1,len(prodict[protein])):
				f2.write(protein + "\t" + prodict[protein][i] + "\n")
f2.close()
f.close()

for key in prodict:
	if prodict[key][0] in dictdegree:
		dictdegree[prodict[key][0]] = dictdegree[prodict[key][0]] + 1
	else:
		dictdegree[prodict[key][0]] = 1

for key in prodict:
	m=0

	if len(prodict[key]) <= 2:
		continue
	increment = increment + 1
	for i in range(1,len(prodict[key])-1):
		for j in range((i+1),len(prodict[key])):
			if prodict[key][i] in prodict[prodict[key][j]]:
				m = m+1

	n = prodict[key][0]			
	cc = 2*m/(n*(n-1))
	prodict[key].append(cc)
	increase = increase + cc

ccAvg = increase/float(increment)
print ("Average Cluster coefficient is " + str(ccAvg))

degree = []
nprotein = []
for key in dictdegree:
	degree.append(key)
	nprotein.append(dictdegree[key])

plt.ylim([0,500])
plt.xlim([0,500])
plt.scatter(degree,nprotein)
plt.show()


	