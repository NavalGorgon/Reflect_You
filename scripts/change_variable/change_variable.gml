///@description change_variable
///@arg id
///@arg var_name_as_string
///@arg value
function change_variable(argument0, argument1, argument2) {

	with(argument0){
		variable_instance_set(id, argument1, argument2);
	}


}
