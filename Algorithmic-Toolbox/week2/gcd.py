# python3

def gcd(a, b):
    if b == 0:
        return a
    else:
        d = a % b
        return gcd(b, d)

if __name__ == '__main__':
    a, b = map(int, input().split())
    print(gcd(a,b))
