import java.io.FileReader;
import java.io.FileWriter;

class appendToFile {
    public static void main(String[] args) throws Exception {
        FileWriter fileW = new FileWriter("file.txt", true);
        fileW.write("Hi!\n");
        fileW.close();

        FileReader fileR = new FileReader("file.txt");
        int character = fileR.read();
        while(character != -1) {
            System.out.print((char)character);
            character = fileR.read();
        }
        fileR.close();
    }
}
