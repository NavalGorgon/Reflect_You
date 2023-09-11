///@description event_register_script
///@arg event
///@arg id
///@arg script
///@arg arg1...*
function event_register_script() {

	with(eventmanager){
		var ev = argument[0];
		var objID = argument[1];
	
		if(!ds_map_exists(eventMap, ev)){
			//Add event to map
			var listenerList = ds_list_create();
		
			//Add the list to the eventMap
			ds_map_add_list(eventMap, ev, listenerList)
		}else{
			var listenerList = eventMap[? ev];
		}
	
		//Add listener info
		var listenerInfo;
	
		//Add listener ID
		listenerInfo[0] = objID;
	
		//Add script and arguments
		var len = argument_count - 2;
		var i = 0; repeat(len){
			listenerInfo[i+1] = argument[i+2];
			i++
		}
	
		//Add listener info to the listener list
		ds_list_add(listenerList, listenerInfo);
	}


}
