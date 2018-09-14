# python3

def gcd(a, b):
    if b == 0:
        return a
    else:
        d = a % b
        return gcd(b,d)

def lcm(a, b):
    g = gcd(a,b)
    if g == 1:
        return a * b
    else:
        d_a = a / g
        d_b = b / g
        return d_a * d_b * gcd

if __name__ == '__main__':
    a, b = map(int, input().split())
    print(lcm(a,b))
