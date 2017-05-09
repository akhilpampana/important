frequencypssm <- function(threshold, weight)
{
	score <- 0
	for (i in 1:18)
	{
		col = i
		variable <- substr(threshold[1], i, i)
		if ("a" == variable)
		{
			row <- 1
		}
		else if("c" == variable)
		{
			row <- 2
		}
		else if("g" == variable)
		{
			row <- 3
		}
		else if("t" == variable)
		{
			row <- 4
		}
		score = score + weight[col][row,]
	}
	return(score)
}