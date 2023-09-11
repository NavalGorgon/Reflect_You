 
depth = -1;
scale = 1;
show_inventory = false;

inv_slots = 16;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;


x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

sinvent = sInvent_UI;

cellsize = 32;

sinv_items_columns = sprite_get_width(sItems)/cellsize;
sinv_items_rows = sprite_get_height(sItems)/cellsize;

inv_ui_width = 376;
inv_ui_height = 192;

inv_ui_x = (gui_width/2)-(inv_ui_width*0.5*scale);
inv_ui_y = (gui_height/2)-(inv_ui_height*0.5*scale);


info_x = inv_ui_x + (9*scale);
info_y = inv_ui_y + (9*scale);

des_x = info_x;
des_y = inv_ui_y + (159*scale);

slots_x = info_x;
slots_y = inv_ui_y + (40*scale);


//EQUIPMENT

equip_x = inv_ui_x + (299*scale);
equip_y = inv_ui_y + (26*scale);

equip_slots_width = 2;
equip_slots_height = 4;
equip_slots = 6;

//HUD

hHeight = sprite_get_height(sHealth_Bar);
hWidth = sprite_get_width(sHealth_Bar);

//	Player Info
// 0 = GOLD
// 1 = NAME
// 2 = HEALTH
// 3 = EXP
// 4 = LEVEL
// 5 = MAX HEALTH


ds_player_info = ds_grid_create(2,10);
ds_player_info[# 0, 0] = "$$";
ds_player_info[# 0, 1] = "Name";
ds_player_info[# 0, 2] = "Health";
ds_player_info[# 0, 3] = "Exp";
ds_player_info[# 0, 4] = "Level";
ds_player_info[# 0, 5] = "Max Health";
ds_player_info[# 0, 6] = "Armour";
ds_player_info[# 0, 7] = "Hidden Armour"
ds_player_info[# 0, 8] = "Max Stamina"
ds_player_info[# 0, 9] = "Stamina"


ds_player_info[# 1, 0] = 0;
ds_player_info[# 1, 1] = "Player";
ds_player_info[# 1, 2] = 100;
ds_player_info[# 1, 3] = 0;
ds_player_info[# 1, 4] = 0;
ds_player_info[# 1, 5] = 100;
ds_player_info[# 1, 6] = 0;
ds_player_info[# 1, 7] = 0;
ds_player_info[# 1, 8] = 100;
ds_player_info[# 1, 8] = 100;


//Inventory
//0 = item
//1 = amount

ds_inventory = ds_grid_create(2, inv_slots);

//Item details                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

ds_items_info = ds_grid_create(4, item.height);

//Item Names
var z = 0, var i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Medicine";
ds_items_info[# z, i++] = "Sword";
ds_items_info[# z, i++] = "Bow";
ds_items_info[# z, i++] = "Helmet";
ds_items_info[# z, i++] = "Platemail";
ds_items_info[# z, i++] = "Shirt";
ds_items_info[# z, i++] = "Belt";
ds_items_info[# z, i++] = "Boots";
ds_items_info[# z, i++] = "Wooden Sword";
ds_items_info[# z, i++] = "Bucket";
ds_items_info[# z, i++] = "Chair";
ds_items_info[# z, i++] = "Picture";
ds_items_info[# z, i++] = "Axe";
ds_items_info[# z, i++] = "Potion";
ds_items_info[# z, i++] = "Starfish";
ds_items_info[# z, i++] = "Mushroom";

//Item Description
var z = 1, var i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "This'll heal you right up";
ds_items_info[# z, i++] = "You call that a knife?";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";
ds_items_info[# z, i++] = "Just some junk";

//Item Category
var z = 2, var i = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = equipment.healing;
ds_items_info[# z, i++] = equipment.weapon;
ds_items_info[# z, i++] = equipment.range;
ds_items_info[# z, i++] = equipment.head;
ds_items_info[# z, i++] = equipment.body;
ds_items_info[# z, i++] = equipment.body;
ds_items_info[# z, i++] = equipment.belt;
ds_items_info[# z, i++] = equipment.feet;
ds_items_info[# z, i++] = equipment.weapon;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;

//Item Stats
var z = 3, var i = 0;
ds_items_info[# z, i++] = 1;
ds_items_info[# z, i++] = 5;
ds_items_info[# z, i++] = 15;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 15;
ds_items_info[# z, i++] = 25;
ds_items_info[# z, i++] = 5;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 10;
ds_items_info[# z, i++] = 10;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;
ds_items_info[# z, i++] = 0;



//Skills
// 0 = DOUBLE JUMP

ds_skills = ds_grid_create(2, 1);

ds_skills[# 0, skills.jump] = true;

ds_skills[# 1, skills.jump] = "Don't ask me how";


//EQUIPMENT

ds_equip = ds_grid_create(8,1);

ds_equip[# 0, 0] = 0;
ds_equip[# 1, 0] = item.bow;
ds_equip[# 2, 0] = item.sword;
ds_equip[# 3, 0] = 0;
ds_equip[# 4, 0] = 0;
ds_equip[# 5, 0] = 0;
ds_equip[# 6, 0] = 0;
ds_equip[# 7, 0] = 0;