//[script, arg0, arg1...]
if(is_array(scripts)){
	var pagescript = scripts[page];
	if(choice_dialogue) pagescript = pagescript[choice];
	
	if(pagescript != -1){
		if(is_array(pagescript[0])){
			var pg_len = array_length_1d(pagescript);
			var i = 0;
			repeat(pg_len){
				var pgscr = pagescript[i];
				var len = array_length_1d(pgscr);
				if(len == 1){ 
					script_execute(pgscr[0]); 
				}else{
					var args = array_create(len-1,0);
					array_copy(args, 0, pgscr, 1, len-1);
					script_execute_alt(pgscr[0], args);
					show_debug_message("worked")
				}
				i += 1;
			}	
		}else{
			var len = array_length_1d(pagescript);
			if(len == 1){ 
				script_execute(pagescript[0]); 
			}else{
				var args = array_create(len-1,0);
				array_copy(args, 0, pagescript, 1, len-1);
				script_execute_alt(pagescript[0], args);
				show_debug_message("didn't work")
			}
		}
	}
}