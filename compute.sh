./argon repo | awk -F '[()]' '{print $2}' | grep -Eo '[0-9]{1,4}' | awk '{s+=$1} END {print s}'
