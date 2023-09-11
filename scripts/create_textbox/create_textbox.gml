///@description create_textbox
///@arg text
///@arg speakers
///@arg next_line
///@arg scripts
///@arg current_line
function create_textbox(argument0, argument1, argument2, argument3, argument4) {

	var tbox = instance_create_layer(0,0,"Text",oTextbox);

	with(tbox){
		text = argument0;
		speakers = argument1;
		next_line = argument2;
		scripts = argument3;
		page = argument4;
	
		var len = array_length_1d(text);
		var i = 0; repeat(len){
			names[i] =		speakers[i].name;
			portraits[i] =	speakers[i].portrait_index;
			voices[i] =		speakers[i].voice;
			i ++;
		}
		event_perform(ev_other,ev_user1);
	}

	return tbox;


}
