///@description hurtbox_create
///@arg xscale
///@arg yscale
///@arg xOffset
///@arg yOffset
function hurtbox_create(argument0, argument1, argument2, argument3) {

	_hurtbox = instance_create_depth(x,y,-1,oHurtbox);
	_hurtbox.owner = id;
	_hurtbox.image_xscale = argument0;
	_hurtbox.image_yscale = argument1;
	_hurtbox.xOffset = argument2;
	_hurtbox.yOffset = argument3;

	return _hurtbox;


}
