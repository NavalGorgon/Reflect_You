///@description hitbox_create
///@arg xscale
///@arg yscale
///@arg xOffset
///@arg yOffset
///@arg life
///@arg xHit
///@arg yHit
///@arg hitStun
///@arg damage
function hitbox_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	_hitbox = instance_create_depth(x,y,-1,oHitbox);
	_hitbox.owner = id;
	_hitbox.image_xscale = argument0;
	_hitbox.image_yscale = argument1;
	_hitbox.xOffset = argument2;
	_hitbox.yOffset = argument3;
	_hitbox.life = argument4;
	_hitbox.xHit = argument5;
	_hitbox.yHit = argument6
	_hitbox.hitStun = argument7;
	_hitbox.damage = argument8;

	return _hitbox;


}
