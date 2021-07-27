import h5py
import numpy as np
import pandas as pd

#Convert imputed genotypes
dataset = h5py.File('../raw_data/genotype/GENOTYPES/4.hdf5', 'r')
print(dataset.keys())

print("reading...")
df1 = pd.DataFrame(np.array(dataset['accessions']))
print("writing...")
df1.to_csv("accessions.txt", sep="\t")

print("reading...")
df2 = pd.DataFrame(np.array(dataset['positions']))
print("writing...")
df2.to_csv("positions.txt", sep="\t")

print("reading...")
df3 = pd.DataFrame(np.array(dataset['snps']))
print("writing...")
df3.to_csv("snps.txt", sep="\t")
