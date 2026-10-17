"""Simple interest calculator using principal, annual rate, and time in years."""

import math


def read_non_negative_number(prompt):
    """Read a finite, non-negative numerical value from the user."""
    while True:
        try:
            value = float(input(prompt))
            if not math.isfinite(value) or value < 0:
                print("Please enter a finite, non-negative number.")
                continue
            return value
        except ValueError:
            print("Invalid input. Please enter a number.")


def calculate_simple_interest(principal, annual_rate, years):
    """Return the simple interest and total amount."""
    interest = principal * annual_rate * years / 100
    return interest, principal + interest


def main():
    print("=== Simple Interest Calculator ===")
    principal = read_non_negative_number("Principal amount: ")
    annual_rate = read_non_negative_number("Annual interest rate (%): ")
    years = read_non_negative_number("Time (years): ")

    interest, total = calculate_simple_interest(principal, annual_rate, years)
    print(f"Simple Interest: {interest:.2f}")
    print(f"Total Amount: {total:.2f}")


if __name__ == "__main__":
    main()
