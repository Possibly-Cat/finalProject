class Bot{
  private int jack = 11;
  private int queen = 12;
  private int king = 13;
  private int ace = 14;
  private int money;
  private Hand hand;
  private int handVal;
  //private int[] shownValue; For adding with betting
  
  public Bot(){
    money = 1000;
    hand = new Hand();
    handVal = 0;
  }
  
  public dealBot(Card card){
    hand.dealHand(card);
  }
  
  public int checkOrBet(int betAmount){//Make better with betting
    if(random(2) == 1){
      return(max(money / 100), betAmount);
    }else{
      return(0);
    }
  }
}
