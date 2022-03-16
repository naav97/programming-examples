def sort(arr):
    i = 1
    while i < len(arr):
        j = i
        while j > 0 and arr[j] < arr[j-1]:
            t = arr[j-1]
            arr[j-1] = arr[j]
            arr[j] = t
            j = j - 1
        i = i + 1

a = [12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222]
print(a)
sort(a)
print(a)
