var str = "";
var i;

for(i = 0; i < ds_quests_number; i += 1){
	var stage = ds_quests[# 1, i];
	if(stage > -1){
		var array = ds_quests[# 2, i];
		var desc = array[stage];
		if(desc[1] != ""){
			str += "\n" + string_upper(ds_quests[# 0, i]) + ": " + desc[1]
		}
	}	
}

draw_set_color(c_yellow);
draw_set_font(fntText);
draw_text_transformed(150,0,str,1,1,0);