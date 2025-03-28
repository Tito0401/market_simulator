int scale_x = 1;
int scale_y = 1;

void draw_graph(int x, float[]y)
{
  background(200);
  if(x / scale_x > width/2) scale_x *=10;
  x = x / scale_x;
  
  for(int t = 0; t < x;t++)
  {
    circle((width/x) * t, -y[t * scale_x]/ scale_y + (height/2),2);
    if(t > 0)line((width/x) * t, -y[t * scale_x] / scale_y + (height/2),(width/x) * (t - 1), -y[(t - 1) * scale_x]/ scale_y + (height/2));
    if(t % 20 == 0)text(t * scale_x,(width/x) * t,height - 50);
  }
  for(int i = 0; i < 20;i++)
  {
    text(- (i - 10) * scale_y, width - 50,(height/20) * i);
  }
}
void reset()
{
scale_y = 1;
scale_x = 1;

}
