class Bot{
  private int jack = 11;
  private int queen = 12;
  private int king = 13;
  private int ace = 14;
  int money;
  private Hand hand;
  private int handVal;
  int roundsBet = 0;
  private String name;
  //private int[] shownValue; For adding with betting
  private String myText = "";
  
  public Bot(String newName){
    name = newName;
    money = 1000;
    hand = new Hand();
    handVal = 0;
  }
  public void clear(){
    hand = new Hand();
    roundsBet = 0;
  }
  
  public String getName(){
    return(name);
  }
  
  public String getText(){
    return(myText);
  }
  
  public void ante(int amount){
    money-= amount;
    myText = name + " bet $" + roundsBet;
  }
  public void dealBot(int card, boolean bool){
    Card myCard = new Card(card, bool);
    hand.dealCard(myCard);
  }
  
  public void cashOut(int payAmount){
    roundsBet = 0;
    if(payAmount == 0){
      myText = name + " folds";
    }
    money+= payAmount;
  }
  
  public void goBroke(){
    money = 0;
  }
  public int getMoney(){
    return(money);
  }
  public int getRoundsBet(){
    return(roundsBet);
  }
  public int checkOrBet(int betAmount){//Make better with betting
    if(random(100) >= 20){
      betAmount-= currBet;
      int currBet = max(money / 500, betAmount);
      roundsBet+= currBet;
      return(currBet);
    }else{
      return(0);
    }
  }
  public Hand getHand(){
    return(hand);
  }
  public int getScore(){
    hand.show();
    return(hand.getGreaterScore());
  }
}
