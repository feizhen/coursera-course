#!/usr/bin/env/ python3
# -*- conding: utf-8 -*-

def fibonacci_number(n):
    fib = [0, 1]
    for x in range(2, n+1):
        fib.append(fib[x-1] + fib[x-2])
    return fib[n]

n = int(input())
print(fibonacci_number(n))
