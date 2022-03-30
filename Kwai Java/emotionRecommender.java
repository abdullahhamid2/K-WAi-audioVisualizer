import java.util.Scanner;

public class emotionRecommender{

    String[] questions;
    KWAiUser user; 
    Emotions emotionalResponse;
    
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("H1ow do you feel? (1-10) ");

        // takes input from the keyboard
        String arousal = input.nextLine();
        String valence = arousal;

        int a = Integer.valueOf(arousal);
        int v = Integer.valueOf(valence);

        System.out.print("Select as many words that describe your current feelings. (reply T/F to each word) \n");
        System.out.println("Content: ");
        String boo = input.nextLine();
        if (boo.equals("T") || boo.equals("t")) {
            v += 9;
            a += 4;
        }
        System.out.print("Bored: ");
        boo = input.nextLine();
        if (boo.equals("T") || boo.equals("t")) {
            v += 4;
            a += 1;
        }
        System.out.print("Worried: ");
        boo = input.nextLine();
        if (boo.equals("T") || boo.equals("t")) {
            v += 1;
            a += 8;
        }

        // prints the values
        System.out.println("Arousal is: " + String.valueOf(a));
        System.out.println("Valence is: " + String.valueOf(v));

        KWAiUser user = new KWAiUser();

        user.setArousal = String.valueOf(a);
        user.setValence = String.valueOf(v);

        // closes the scanner
        input.close();
        
    }

}