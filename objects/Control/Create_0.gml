died = false;

global.game_width = 480*2;
global.game_height = 270*2;

display_set_gui_size(global.game_width,global.game_height);

black_alpha = 0;

spawn_room = -1;
doTransition = false;
spawnX = 0;
spawnY = 0;

//run scripts
enum_init();
randomize();



scale = 1;
gscale = 10;
bIndex = 0;

go_width = sprite_get_width(sprite12);
go_height = sprite_get_height(sprite12);
game_over_x = (global.game_width/2) - (go_width*gscale*0.5);
game_over_y = (global.game_height/2) - (go_height*gscale*0.5);

button_x = (global.game_width/2) - (100*scale);
button_y = (global.game_height/2) + (go_height*0.5*gscale) + 10;
button_x2 = button_x + 200*scale;
button_y2 = button_y + 50*scale;

doFade = false;
fade_out = false;
fade_in = false;
o_speed = 1;