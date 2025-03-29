package Game;

import java.util.Objects;
import java.util.Random;
import java.util.Scanner;

public class Game {

    private static int getDamage(String name) {
        Scanner sc = new Scanner(System.in);
        Random random = new Random();
        int dmg = 0;
        while (dmg <= 0 || dmg > 9) {
            System.out.printf("%s, enter damage: ", name);
            dmg = sc.nextInt();
        }
        int chance = random.nextInt(1, 10);
        if (chance >= 1 && chance <= (10 - dmg)) {
            return dmg;
        }
        return 0;
    }

    private static String getName(int index) {
        Scanner sc = new Scanner(System.in);
        String name = null;
        while (Objects.isNull(name)) {
            System.out.printf("Enter player %s name: ", index + 1);
            name = sc.nextLine();
            if (name.isEmpty() || name.length() > 15) {
                name = null;
            }
        }
        return name;
    }

    private static Player[] getPlayers() {

        Player[] players = new Player[2];
        for(int i = 0; i < players.length; i++) {
            players[i] = new Player(getName(i));
        }
        return players;
    }

    public static void move(Player p1, Player p2) {
        int damage = getDamage(p1.getName());
        p2.minusHp(damage);
    }

    private static boolean logic(int indexP1, int indexP2, Player[] players) {
        move(players[indexP1], players[indexP2]);
        if (!players[indexP2].isAlive()) {
            System.out.printf("%s is the Winner!", players[indexP1].getName());
            return true;
        }
        System.out.printf("%s's HP remaining: %s\n", players[indexP2].getName(),players[indexP2].getHp());
        return false;
    }

    public static void main(String[] args) {
        Player[] players = getPlayers();
        while (true) {
            if (logic(0, 1, players)) {
                break;
            } else if (logic(1, 0, players)) {
                break;
            }
        }
    }
}
