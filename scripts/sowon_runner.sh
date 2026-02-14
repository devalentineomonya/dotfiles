#!/bin/bash

TOTAL_HOURS=4
CHUNK_MINUTES=30

CHUNK_SECONDS=$((CHUNK_MINUTES * 60))
TOTAL_CHUNKS=$(( (TOTAL_HOURS * 60) / CHUNK_MINUTES ))

remaining=$TOTAL_CHUNKS

echo "Starting $TOTAL_HOURS hours in $CHUNK_MINUTES-minute chunks..."
echo "Total runs: $TOTAL_CHUNKS"
echo "----------------------------------------"

while [ $remaining -gt 0 ]; do
    echo "Starting chunk $((TOTAL_CHUNKS - remaining + 1))..."
    echo "Runs left after this: $((remaining - 1))"
    
    sowon $CHUNK_SECONDS &
    pid=$!

    # Wait for sowon to finish
    wait $pid

    # If it somehow hangs at 00, force kill
    if kill -0 $pid 2>/dev/null; then
        kill $pid
    fi

    remaining=$((remaining - 1))
    echo "----------------------------------------"
done

echo "✅ All 4 hours completed."
