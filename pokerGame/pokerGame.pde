
private ArrayList<Bot> players;
private ArrayList<Bot> activePlayers;
private Player human = new Player();
int currBet = 0;
int pot = 0;
int[] deck = new int[52];


void setup(){
  for(int x = 0; x < 52; x++){
    deck[x] = x;
  }
  size(500, 400);
  background(51);
  players = new ArrayList<Bot>();
  players.add(human);
  for(int x = 0; x < 5; x++){this.addBot();}
  //activePlayers = players.clone();
  deal();
  deal();
  deal();
  deal();
  deal();
  players.get(0).getHand().displayHand(20, 20);
}

void addBot(){
  Bot addMe = new Bot();
  players.add(addMe);
}
void deal(){
  for(Bot player:players){//change back to active players
    int index = round(random(deck.length));
    player.dealBot(deck[index]);
    deck = this.takeFromDeck(index);
  }
}

void Ante(int anteAmount){
    for(Bot player:players){
      if(player.getMoney() < anteAmount){
        pot+= player.getMoney();
        player.goBroke();
      }else{
        pot+= anteAmount;
        player.ante(anteAmount);
      }
  }
}

int[] takeFromDeck(int index){
  int[] newDeck = new int[deck.length - 1];
  for(int x = 0; x < index; x++){
    newDeck[x] = deck[x];
  }
  for(int x = index + 1; x < newDeck.length; x++){
    newDeck[x - 1] = deck[x];
  }
  return(newDeck);
}
void playRound(int anteAmount){
  arrayCopy(players, activePlayers);
  for(Bot player:players){
    if(activePlayers.contains(player)){
      int bet = player.checkOrBet(currBet);
      if(player.getRoundsBet() >= currBet){
        player.ante(bet);
        currBet = player.getRoundsBet();
      } else{
        activePlayers.remove(player);
        player.cashOut(0);
      }
    }
  }
}
