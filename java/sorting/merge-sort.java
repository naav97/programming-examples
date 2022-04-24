class MergeSort {
    public static void main(String[] args) {
        int[] a = {43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,45,777,556,64};
        printArray(a);
        sort(a, 0, a.length - 1);
        printArray(a);
    }

    public static void merge(int[] arr, int i, int j, int m) {
        int l = i;
        int r = m + 1;
        int[] tempArr = new int[(j-i) + 1];
        int count = 0;

        while(l <= m && r <= j) {
            if(arr[l] <= arr[r]) {
                tempArr[count] = arr[l];
                l = l + 1;
                count = count + 1;
            }
            else {
                tempArr[count] = arr[r];
                r = r + 1;
                count = count + 1;
            }
        }

        while(l <= m) {
            tempArr[count] = arr[l];
            l = l + 1;
            count = count + 1;
        }

        while(r <= j) {
            tempArr[count] = arr[r];
            r = r + 1;
            count = count + 1;
        }

        int k = i;
        while(k <= j) {
            arr[k] = tempArr[k-i];
            k = k + 1;
        }
    }

    public static void sort(int[] arr, int i, int j) {
        if(j > i) {
            int mitad = ((j-i)/2) + i;
            sort(arr, i, mitad);
            sort(arr, mitad + 1, j);
            merge(arr, i, j, mitad);
        }
    }

    public static void printArray(int[] arr){
        System.out.print("[");
        for(int i = 0; i < arr.length; i++){
            if(i == arr.length - 1){
                System.out.print(arr[i]);
                break;
            }
            System.out.print(arr[i] + ", ");
        }
        System.out.println("]");
    }
}
