cd /mnt/nfs/scratch1/nnayak/DPLP

source dplp_ve/bin/activate

./corenlp.sh data/
python convert.py data/
python segmenter.py ./data/
python rstparser.py ./data/
