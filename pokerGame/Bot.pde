class Bot{
  private int jack = 11;
  private int queen = 12;
  private int king = 13;
  private int ace = 14;
  private int money;
  private Hand hand;
  private int handVal;
  private int roundsBet = 0;
  //private int[] shownValue; For adding with betting
  
  public Bot(){
    money = 1000;
    hand = new Hand();
    handVal = 0;
  }
  
  public int ante(int amount){
    money-= amount;
  }
  public void dealBot(int card){
    Card myCard = new Card(card);
    hand.dealCard(myCard);
  }
  
  public void cashOut(payAmount){
    roundsBet = 0;
    money+= payAmount;
  }
  
  public void goBroke(){
    money == 0;
  }
  public int getMoney(){
    return(money);
  }
  public int getRoundsBet(){
    return(roundsBet);
  }
  public int checkOrBet(int betAmount){//Make better with betting
    if(random(2) == 1){
      betAmount-= currBet;
      int currBet = max(money / 100, betAmount);
      roundsBet+= currBet;
      return(currBet);
    }else{
      return(0);
    }
  }
}
