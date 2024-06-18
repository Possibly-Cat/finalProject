class Card{
  private int jack = 11;
  private int queen = 12;
  private int king = 13;
  private int ace = 14;
  private int value;
  private PImage face;
  private String suit;
  private boolean hide;
  private int[] values = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};//Mod13 can be used to find value from ref, pay special attention to ace value of fourteen/one
  private  String[] heartNames = {"2_of_hearts", "3_of_hearts", "4_of_hearts", "5_of_hearts", "6_of_hearts", "7_of_hearts", "8_of_hearts", "9_of_hearts", "10_of_hearts", "jack_of_hearts2", "queen_of_hearts2", "king_of_hearts2", "ace_of_hearts"};
  private  String[] diamondNames = {"2_of_diamonds", "3_of_diamonds", "4_of_diamonds", "5_of_diamonds", "6_of_diamonds", "7_of_diamonds", "8_of_diamonds", "9_of_diamonds", "10_of_diamonds", "jack_of_diamonds2", "queen_of_diamonds2", "king_of_diamonds2", "ace_of_diamonds"};
  private  String[] clubNames = {"2_of_clubs", "3_of_clubs", "4_of_clubs", "5_of_clubs", "6_of_clubs", "7_of_clubs", "8_of_clubs", "9_of_clubs", "10_of_clubs", "jack_of_clubs2", "queen_of_clubs2", "king_of_clubs2", "ace_of_clubs"};
  public  String[] spadeNames = {"2_of_spades", "3_of_spades", "4_of_spades", "5_of_spades", "6_of_spades", "7_of_spades", "8_of_spades", "9_of_spades", "10_of_spades", "jack_of_spades2", "queen_of_spades2", "king_of_spades2", "ace_of_spades2"};
  
  public Card(int num, boolean hidden){
    value = values[num % 13];
    hide = hidden;
    if(num < 13){
      suit = "hearts";
      face = loadImage("Poker cards/" + heartNames[num % 13] + ".png");
    }
    if(num >= 13 && num < 26){
     suit = "diamonds'";
     face = loadImage("Poker cards/" + diamondNames[num % 13] + ".png");
    }
    if(num >= 26 && num < 39){
      suit = "clubs";
      face = loadImage("Poker cards/" + clubNames[num % 13] + ".png");
    }
    if(num >= 39){
      suit = "spades";
      face = loadImage("Poker cards/" + spadeNames[num % 13] + ".png");
    }
  }
  public void show(){
    hide = false;
  }
  public boolean hidden(){
    return(hide);
  }
  public void displayCard(int x, int y){
    if(hide){
      PImage loadThis = loadImage("Poker cards/red_joker.png");
      image(loadThis, x, y, 65, 91);
    }else{
      image(this.face, x, y, 65, 91);
    }
  }

  public int getVal(){
    return(value);
  }
  public PImage getFace(){
    return(face);
  }
  public String getSuit(){
    return(suit);
  }
}
  
  
