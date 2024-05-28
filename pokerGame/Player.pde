class Player extends Bot{
 public Player(){
   super();
 }
  @Override
  public int checkOrBet(int betAmount){//Make player input
    if(random(2) == 1){
      return(max(money / 100), betAmount);
    }else{
      return(0);
    }
  }
  
}
