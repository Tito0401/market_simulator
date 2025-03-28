int counter = 1;
float[] capital = new float[10000000];
float[] user_cash = new float[1000];
float[] user_property = new float[1000];
float tax = 1; // tax 0%
int last_counter = 0;

void setup()
{
  size(800,800);
  frameRate(1000);

}
void draw()
{
  capital[counter] = calculate_user_expenses(1);
  if(capital[counter]/scale_y > height / 2) scale_y *= 10;
  draw_graph(counter,capital);
  // when capital is bigger than 100000 reset the graph and increese tax 
  if(capital[counter] > 100000)
  {
    println(counter + " " + tax + " " + capital[counter]);
    for(int i = 0; i < counter; i++)capital[i] = 0;
    user_cash[1] = 0;
    user_property[1] = 0;
    tax -=0.001;
    counter = 0;
    reset();
  }
  else counter++;
  
}
float calculate_user_expenses(int user_id)
{
  // how much did user earn
  user_cash[user_id] += (user_property[user_id]*0.01) + 10;
  //actions from user
  sell(user_id,random(0,user_property[user_id]));
  buy(user_id,random(0,user_cash[user_id]));
  
  return user_cash[user_id];
}

void sell(int user_id, float cost)
{
   user_property[user_id] -= cost;
   user_cash[user_id] += cost * tax;
}

void buy(int user_id, float cost)
{
   user_cash[user_id] -= cost;
   user_property[user_id] += cost * tax;
}
