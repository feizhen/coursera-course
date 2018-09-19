# python3

def money_change(total):
    if total == 1 or total == 5 or total == 10:
        return 1
    else:
        if total > 10:
            return 1 + money_change(total - 10)
        elif total > 5:
            return 1 + money_change(total - 5)
        else:
            return 1 + money_change(total - 1)

if __name__ == '__main__':
    n = int(input())
    print(money_change(n))
