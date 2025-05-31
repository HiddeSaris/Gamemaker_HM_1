// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_border(xx,yy,text,xs,ys,col1,col2)
{
    draw_set_colour(col1);
    draw_text_transformed(xx-1*xs*0.5,yy-1*ys*0.5,text,xs,ys,0);
    draw_text_transformed(xx-1*xs*0.5,yy+1*ys*0.5,text,xs,ys,0);
    draw_text_transformed(xx+1*xs*0.5,yy+1*ys*0.5,text,xs,ys,0);
    draw_text_transformed(xx+1*xs*0.5,yy-1*ys*0.5,text,xs,ys,0);
    draw_set_colour(col2);
    draw_text_transformed(xx,yy,text,xs,ys,0);
}