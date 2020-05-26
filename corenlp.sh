#!/usr/bin/env bash
#
# Runs Stanford CoreNLP.
# Simple uses for xml and plain text output to files are:
#    ./corenlp.sh -file filename
#    ./corenlp.sh -file filename -outputFormat text 

#scriptdir=`dirname $0`
scriptdir="./stanford-corenlp-full-2018-02-27/"
java -version
echo $PATH

# echo java -mx3g -cp \"$scriptdir/*\" edu.stanford.nlp.pipeline.StanfordCoreNLP $*

# $1 - path

java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly -tokenize.whitespace true -file data/example.txt

DATAPATH=$1
for FNAME in $DATAPATH/*
do
    java -version
    java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly -tokenize.whitespace true -file $FNAME
    # /usr/bin/java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse -file $FNAME
    /bin/mv $(/usr/bin/basename $FNAME.xml) $DATAPATH/
done
