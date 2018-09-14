#!/usr/bin/env/ python3

def fibonacci_last_digit(n):
    fib = [0, 1]
    for x in range(2, n+1):
        fib.append((fib[x-1] + fib[x-2]) % 10)
    return fib[n]

n = int(input())
print(fibonacci_last_digit(n))
