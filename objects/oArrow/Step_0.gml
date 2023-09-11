ySpeed += 0.05;

image_angle = -1*darctan(ySpeed/xSpeed);
hitbox.image_angle = image_angle;

if(place_meeting(x,y,oSolid)){
	instance_destroy(hitbox);
	instance_destroy();
}