library(dplyr)
library(AmyloGram)
library(biogram)

data("AmyloGram_model")

AmyloGram_alph <- lapply(AmyloGram_model[["enc"]], toupper)

raw_seqs_list <- c(read_fasta("https://raw.githubusercontent.com/michbur/AmyloGramAnalysis/master/data/amyloid_pos_full.fasta"),
                   read_fasta("https://raw.githubusercontent.com/michbur/AmyloGramAnalysis/master/data/amyloid_neg_full.fasta"))
#sequences longer than 5 aa and shorter than 26 aa
purified_seqs_id <- lengths(raw_seqs_list) > 5 & lengths(raw_seqs_list) < 26
seqs_list <- raw_seqs_list[purified_seqs_id]

degenerated_seqs <- lapply(seqs_list, degenerate, AmyloGram_alph)
