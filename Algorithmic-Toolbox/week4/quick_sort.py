# python3
from random import randint
import sys

# get a random number between low and high
def swap(arr, i, j):
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp

def partition(arr, left, right):
    seed = randint(left, right)
    pivot = arr[seed]
    pos = left

    for i in range(left+1, right+1):
        if arr[i] < pivot or arr[i] == pivot:
            pos += 1
            swap(arr, pos, i)
    swap(arr, pos, seed)
    return pos

def quick_sort_rec(arr, left, right):
    while left < right:
        mid = partition(arr, left, right)
        if (mid - left) < (right - mid):
            quick_sort_rec(arr, left, mid - 1)
            left = mid + 1
        else:
            quick_sort_rec(arr, mid + 1, right)
            right = mid - 1

def quick_sort(arr):
    left = 0
    right = len(arr) - 1
    quick_sort_rec(arr, left, right)


if __name__ == '__main__':
    data = list(map(int, sys.stdin.read().split()))
    quick_sort(data)
    print(data)
