box = sTextbox;
frame = sFrame;
portrait = sPortraits;
namebox = sNamebox;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

port_x = (global.game_width - box_width - port_width)*0.5;
port_y = (global.game_height*0.02);
box_x = port_x + port_width;
box_y = port_y;
namebox_x = port_x;
namebox_y = port_y + port_height;

x_buffer = 12;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);
text_max_width = box_width - 2*x_buffer;


portrait_index = 0;
counter = 0;
pause = false;

text[0] = "";
page = 0;
name = "";
voice = sndVoice_1;

interact_key = ord("E"); 
choice = 0;
choice_col = c_red;

text_col = c_black;
name_col = c_black;

font = fntText;
draw_set_font(font);
text_height = string_height("M");