#!/bin/bash

# Run dbt tests and capture the output
dbt test > results/test_results.txt 2>&1

# Optionally, you can append a timestamp to the results file
echo "Test run at: $(date)" >> results/test_results.txt
