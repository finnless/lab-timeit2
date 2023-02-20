#!/bin/bash
# this script can be used to automate timing the func and container pairs from
# https://github.com/mikeizbicki/lab-timeit2/blob/b0602a6604a23f942ef64642eb8a0065b3f39f41/README.md?plain=1#L224-L235
cont=("numpy.array" "list" "tuple" "deque")
func=("sequential_search_itr" "sequential_search_itr2" "sequential_search_rec" "binary_search_itr" "binary_search_rec" "binary_search_rec2")

for f in ${func[@]}; do
    for c in ${cont[@]}; do
        echo "f=$f, c=$c"
        python3 -m timeit \
            -s "import notes; import numpy; from collections import deque; n = 65536; xs = $c(range(-n,n))" \
            "notes.$f(xs,5)"
    done
done
