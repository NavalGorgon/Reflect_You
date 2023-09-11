cell_size = 32;
spr_width = sprite_get_width(sItems);
spr_height = sprite_get_height(sItems);

item_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size/2;
y_offset = cell_size;

drop_move	= true; 
xSpeed		= random_range(-2,2);
ySpeed		= random_range(-1,-3);