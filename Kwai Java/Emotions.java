//K-WAi Emotional Assesment Structure
public class Emotions{

    public static int valence;
    public static int arousal;

    public static void main(String[] args) {
        String emotion = "";

        arousal = 10;
        valence = 18;

        if (arousal < 5) {
            if (valence < 15) emotion = "sleep";
            else emotion = "calm";
        }
        else if (arousal < 10) {
            if (valence >= 7) emotion = "focus/motivational";
        }
        else emotion = "happy";
        
        System.out.println(emotion);
    }

}
