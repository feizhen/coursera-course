# python3

def get_values(capacity, pairs):
    if capacity < pairs[0][1]:
        return 0
    else:
        target = pairs[0]
        pairs = pairs[1:]
        return target[0] + get_values(capacity - target[1], pairs)

def maximum_value_of_the_loot(capacity, weights, values):
