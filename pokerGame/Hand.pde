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
 public int numSuitInHand(String suit){
   int retInt = 0;
   for(int x = 0; x < cards.size(); x++){
     if(cards.get(x).getSuit().equals(suit)){retInt++;}
   }
   return(retInt);
 }
 
 public ArrayList<Card> getList(){
   return(cards);
 }
  
}
