import igraph as ig
import warnings
warnings.filterwarnings("ignore")


def wilcox(protein_list, p_list, wilcox_test):
	g=ig.Graph()
	prodict={}
	edges=[]
	vertices=[]
	with open(p_list, "r") as f:
		for line in f:
			line.rstrip()
			words=line.split("\t")
			#print words
			pro1=words[0].rstrip()
			pro2=words[1].rstrip()
			edge=[]
			edge.append(pro1)
			edge.append(pro2)
			edges.append(edge)
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

	for key in prodict:
		vertices.append(key)

	g.add_vertices(vertices)
	print g
	g.add_edges(edges)
	#print g
	proteinlist=[]
	with open(protein_list, "r") as f:
		for line in f:
			protein=line.rstrip()
			proteinlist.append(protein)

	f1 = open(wilcox_test,"w")

	for i in range(0,len(proteinlist)-1):
		for j in range((i+1), len(proteinlist)):
			if proteinlist[i] in vertices and proteinlist[j] in vertices:
				spath=g.get_shortest_paths(proteinlist[i], proteinlist[j])
				if len(spath[0])>0:
					spathlen=g.shortest_paths(proteinlist[i], proteinlist[j])
					f1.write(str(spathlen[0][0])+"\n")
					#print spathlen
	f1.close()


wilcox("protein-list1.txt", "plist1.txt", "wilcox1.txt")
wilcox("protein-list2.txt", "plist2.txt", "wilcox2.txt")
