import java.util.Scanner;

public class FirstProject {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int n = s.nextInt();
        for(int i = 1; i < n+1; i++) {
            String spc = " ".repeat(n-i);
            String a = "1 ".repeat(n);
            System.out.println(spc + a);
        }
    }
}
