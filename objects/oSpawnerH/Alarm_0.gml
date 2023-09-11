
if (i != hunterNum){
	instance_create_layer(x+40*i,y,"Instances",oHunter);
	i += 1;
	alarm[0] = random_range(1,3)*room_speed;
}else{
	i = 0;
	round_end = true;
}
