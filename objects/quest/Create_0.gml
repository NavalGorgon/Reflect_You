#region QUESTS
var quest_array = [

	[
		//Title
		"Help a Brother Out",
		//Stage
		-1,
		//Stage Infos
		[
			[type.travel, "Go meet Lukas", room3, [256,224], [288,256]], 
			[type.unique, "fgh", -1],
			[type.fetch, "Grab his stuff", item.boots, oBrother],
			[type.talk, "Talk to Lukas", oBrother, 6]
		],
		//Priority
		1	
	],
	

	[
	
		"MORE!",
		
		-1,
		
		[
			[type.kill, "Kill Three Blue Slimes", event.blue_death, 3, 0, false],
			[type.talk, "Talk to Lukas", oBrother, 8]
		],
		
		0
		
	]

]
#endregion

ds_quests = create_ds_grid_from_array(quest_array);
ds_quests_number = ds_grid_height(ds_quests);

bro_quests = [
				[quests.more, 2, 1]
]