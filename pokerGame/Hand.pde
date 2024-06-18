class Hand{
  private int jack = 11;
  private int queen = 12;
  private int king = 13;
  private int ace = 14;
 private ArrayList<Card> cards;
 //private double handVal; Add for betting stuff
 public Hand(){
   cards = new ArrayList<Card>();
 }
 public void dealCard(Card newCard){
   cards.add(newCard);
 }
 public int numValInHand(int val){
   int retInt = 0;
   for(int x = 0; x < cards.size(); x++){
     if(cards.get(x).getVal() == val){retInt++;}
   }
   return(retInt);
 }
 public void displayHand(int startX, int startY){
   for(Card crd:cards){
     crd.displayCard(startX, startY);
     startX+=70;
   }
 }
 public int numSuitInHand(String suit){
   int retInt = 0;
   for(int x = 0; x < cards.size(); x++){
     if(cards.get(x).getSuit().equals(suit)){retInt++;}
   }
   return(retInt);
 }
 public void show(){
   for(Card card:cards){
     card.show();
   }
 }
 
 public ArrayList<Card> getList(){
   return(cards);
 }
 boolean isFlush(){
   if(numSuitInHand("clubs") >= 5 || numSuitInHand("hearts") >= 5 || numSuitInHand("diamonds") >= 5 || numSuitInHand("spades") >= 5){
     return(true);
   }
   return(false);
 }
 int isStraight(){
   for(int x = 2; x < 10; x++){
     if(numValInHand(x) >= 1 && numValInHand(x + 1) >= 1 && numValInHand(x + 2) >= 1 && numValInHand(x + 3) >= 1 && numValInHand(x + 4) >= 1){
       return(x + 4);
     }
   }
   return(-1);
 }
 
 int fourOfKind(){
   for(int x = 2; x < 15; x++){
     if(numValInHand(x) >= 4){
       return(x);
     }
   }
   return(-1);
 }
 int threeOfKind(){
   for(int x = 2; x < 15; x++){
     if(numValInHand(x) >= 3){
       return(x);
     }
   }
   return(-1);
 }
 
 int numPairs(){
   int retNum = 0;
   for(int x = 2; x < 15; x++){
     if(numValInHand(x) >= 2){
       retNum++;
     }
   }
   return(retNum);
 }
  
  public int getGreaterScore(){
    int stV = isStraight();
    boolean flV = isFlush();
    int fOK = fourOfKind();
    int tOK = threeOfKind();
    int pairs = numPairs();
    if(stV == 14 && flV){
      return(9);
    }
    if(stV != -1 && flV){
      return(8);
    }
    if(fOK != -1){
      return(7);
    }
    if(tOK != -1 && pairs != 0){
      return(6);
    }
    if(flV){
      return(5);
    }
    if(stV != -1){
      return(4);
    }
    if(tOK != -1){
      return(3);
    }
    if(pairs >= 2){
      return(2);
    }
    if(pairs == 1){
      return(1);
    }
    return(0);
  }
    
    
}
