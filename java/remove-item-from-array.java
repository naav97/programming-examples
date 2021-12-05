import java.util.Arrays;

class main {
    public static void main(String[] args){
        String[] cars = {"Ford", "Volvo", "BWM"};

        System.out.println(Arrays.toString(cars));

        String[] newArr = new String[cars.length-1];
        int j = 0;
        for(int i = 0; i < cars.length; i++){
            if(cars[i] != "Volvo"){
                newArr[j] = cars[i];
                j++;
            }
        }

        System.out.println(Arrays.toString(newArr));
    }
}
