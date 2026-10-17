#!/usr/bin/env bash
# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Annual Rate * Time in Years) / 100
# Run with: bash simple-interest.sh

set -euo pipefail

is_nonnegative_number() {
  [[ "$1" =~ ^([0-9]+(\.[0-9]*)?|\.[0-9]+)$ ]]
}

echo "=== Simple Interest Calculator ==="
read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

if ! is_nonnegative_number "$principal" ||
   ! is_nonnegative_number "$rate" ||
   ! is_nonnegative_number "$time"; then
  echo "Error: Please enter non-negative numbers for all three inputs." >&2
  exit 1
fi

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
  interest = (p * r * t) / 100
  printf "Simple Interest: %.2f\n", interest
  printf "Total Amount: %.2f\n", p + interest
}'
