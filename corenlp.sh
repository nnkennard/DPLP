#!/usr/bin/env bash
#
# Runs Stanford CoreNLP.
# Simple uses for xml and plain text output to files are:
#    ./corenlp.sh -file filename
#    ./corenlp.sh -file filename -outputFormat text 

scriptdir="./stanford-corenlp-full-2018-02-27/"
java -version
echo $PATH

DATAPATH=$1
for FNAME in $DATAPATH/*
do
    java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP \
      -annotators tokenize,ssplit,pos,lemma,ner,parse \
      -tokenize.whitespace false -file $FNAME
    /bin/mv $(/usr/bin/basename $FNAME.xml) $DATAPATH/
done
