# python3

def fibonacci(n):
    fib = [0, 1]
    for x in range(2, n+1):
        fib.append(fib[x-1] + fib[x-2])
    return fib[n]

def fibonacci_again(n, m):
    fib = [0, 1, 1]
    is_periodic = False
    period = 0
    for x in range(3, n+1):
        cur = fibonacci(x) % m
        fib.append(cur)
        if fib[x] == 1 and fib[x-1] == 0:
            is_periodic = True
            period = x - 1
            break
    if is_periodic:
        sm = n % period
        return fibonacci(sm) % m
    else:
        return fib[n]


if __name__ == '__main__':
    n, m = map(int, input().split())
    print(fibonacci_again(n,m))
