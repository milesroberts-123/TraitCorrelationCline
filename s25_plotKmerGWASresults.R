#Goal: take gemma output and make manhattan plot
rm(list = ls())
library(data.table)
library(ggplot2)
library(R.utils) #so that we can read gzipped files with fread

#Extract script arguments
args = commandArgs(trailingOnly=TRUE)

#Load GEMMA results
print(paste("Loading GEMMA results from", args[1], "..."))
mysnps = fread(args[1], nThread = 40)

#Determine p-value cutoffs
print("Calculating p-value cutoffs...")
mysnps$p_wald_bh = p.adjust(mysnps$p_wald, method = "BH")

#What is the bh-corrected cutoff for significance?
bhCutoff = -log10(max(mysnps$p_wald[which(mysnps$p_wald_bh < 0.05)]))
bfCutoff = -log10(0.05/nrow(mysnps))

print("-log10(BH cutoff):")
print(bhCutoff)
print("-log10(BF cutoff):")
print(bfCutoff)

#Remove all but 100,000 most significant kmers
mysnps = mysnps[order(mysnps$p_wald),]
mysnps = mysnps[1:100000,]

#Convert p-value into log base 10 p-value
mysnps$p_wald = -log10(mysnps$p_wald)

#Plot results
print(paste("Plotting results to", args[2], "..."))
ggplot(mysnps, aes(x = rs, y = p_wald)) +
	geom_point() + 
	geom_hline(yintercept=bhCutoff, linetype="dashed", color = "red", size=2) +
	geom_hline(yintercept=bfCutoff, color = "red", size=2) +
	theme_classic() +                                                 
	theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
	labs(x = "k-mer (alphabetical order)", y = "-log10(p-value)")

#Save result
ggsave(args[2])
