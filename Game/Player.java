package Game;

public class Player {
    private int hp;
    private String name;

    public Player(String name) {
        this.hp = 100;
        this.name = name;
    }

    public int getHp() {
        return hp;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void minusHp(int damage) {
        this.hp -= damage * 10;
    }

    public boolean isAlive() {
        return this.hp > 0;
    }
}
