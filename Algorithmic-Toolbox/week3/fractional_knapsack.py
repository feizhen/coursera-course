# Uses python3
import sys

def get_optimal_value(capacity, weights, values):
    value = 0.
    # write your code here
    l = len(weights)
    pairs = []
    for x in range(l):
        pairs.append((weights[x], values[x]))

    pairs = sorted(pairs, key=lambda x:x[1]/x[0], reverse=True)

    index = 0

    while (capacity > 0 and index < l):
        if capacity > pairs[index][0]:
            value += pairs[index][1]
            capacity = capacity - pairs[index][0]
            index += 1
        else:
            unit = pairs[index][1] / pairs[index][0]
            value += capacity * unit
            capacity = capacity - pairs[index][0]

    return value



if __name__ == "__main__":
    data = list(map(int, sys.stdin.read().split()))
    n, capacity = data[0:2]
    values = data[2:(2 * n + 2):2]
    weights = data[3:(2 * n + 2):2]
    opt_value = get_optimal_value(capacity, weights, values)
    print("{:.10f}".format(opt_value))
