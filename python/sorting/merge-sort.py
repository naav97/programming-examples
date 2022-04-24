nums = [43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,234,45,777,556,64]
print(nums)

def merge(arr,i,j,m):
    l = i
    r = m + 1
    tempArr = []

    while(l <= m and r <= j):
        if arr[l] <= arr[r]:
            tempArr.append(arr[l])
            l = l + 1
        else:
            tempArr.append(arr[r])
            r = r + 1

    while l <= m:
        tempArr.append(arr[l])
        l = l + 1

    while r <= j:
        tempArr.append(arr[r])
        r = r + 1

    k = i
    while k <= j:
        arr[k] = tempArr[k-i]
        k = k + 1

def sort(arr,i,j):
    if j > i:
        mitad = int(((j-i)/2) + i)
        sort(arr, i, mitad)
        sort(arr, mitad + 1, j)
        merge(arr,i,j,mitad)

sort(nums, 0, len(nums) - 1)

print(nums)
