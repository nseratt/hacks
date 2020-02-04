#!/bin/bash

# requirements:
#   pip install shodan
#   shodan init <api-key>


shodandomain=$(shodan domain $1)

echo "$shodandomain" | grep 'v=spf' | sed 's/ /\n/g;s/include://g' | grep -i '$scandomain'
echo "$shodandomain" | awk -v var="$1" '/(\w+)\s+(A|CNAME)\s+(\w+)/{print $1"."var}'
