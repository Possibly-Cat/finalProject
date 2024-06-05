
private ArrayList<Bot> players;
private ArrayList<Bot> activePlayers;
private String[] names = {"Bob", "Jeff", "David", "John", "Hugh Man"};
private Player human = new Player();
int currBet = 0;
int pot = 0;
int[] deck = new int[52];
String currDisplayText = "";


void setup(){
  int scale = 1;
  for(int x = 0; x < 52; x++){
    deck[x] = x;
  }
  size(1000, 800);
  background(51);
  players = new ArrayList<Bot>();
  players.add(human);
  for(int x = 0; x < 5; x++){this.addBot(names[x]);}
  activePlayers = new ArrayList<Bot>();
  copyThisTo(players, activePlayers);
  //deal();
  //deal();
  //deal();
  //drawAll();
  playRound(50);
}

void addBot(String str){
  Bot addMe = new Bot(str);
  players.add(addMe);
}
void deal(){
  for(Bot player:players){//change back to active players
    int index = round(random(deck.length - 1));
    player.dealBot(deck[index]);
    deck = this.takeFromDeck(index);
  }
}

void draw(){
  background(51);
  int y = 20;
  text(currDisplayText, 500, 400);
  for(Bot player:players){
    text(player.getName(), 0, y + 30);
    text("$" + player.getMoney(), 0, y + 40);
    player.getHand().displayHand(60, y);
    y+= 100;
  }
  delay(20);
}
void drawManual(){
  background(51);
  int y = 20;
  text(currDisplayText, 500, 400);
  for(Bot player:players){
    text(player.getName(), 0, y + 30);
    text("$" + player.getMoney(), 0, y + 40);
    player.getHand().displayHand(60, y);
    y+= 100;
  }
  delay(20);
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
  Ante(anteAmount);
  copyThisTo(players, activePlayers);
  deal();
  deal();
  deal();
  drawManual();
  for(Bot player:players){
    if(activePlayers.contains(player)){
      int bet = player.checkOrBet(currBet);
      if(player.getRoundsBet() >= currBet){
        player.ante(bet);
        currBet = player.getRoundsBet();
        currDisplayText = player.getName() + " raises to $" + currBet;
      } else{
        currDisplayText = player.getName() + " folds";
        activePlayers.remove(player);
        player.cashOut(0);
      }
    }
    text(currDisplayText, 500, 400);
  }
}

void copyThisTo(ArrayList<Bot> one, ArrayList<Bot> two){
  two = new ArrayList<Bot>();
  for(Bot player:one){
    two.add(player);
  }
}
