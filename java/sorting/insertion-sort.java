class insertionSort {
    public static void main(String[] args){
        int[] a = {12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222};
        printArray(a);
        sort(a);
        printArray(a);
    }

    public static void sort(int[] arr){
        for(int i = 1; i < arr.length; i++){
            for(int j = i; j > 0 && arr[j] < arr[j-1]; j--){
                int t = arr[j-1];
                arr[j-1] = arr[j];
                arr[j] = t;
            }
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
