
event_inherited();

quest_status = [
				[quests.more, 2, 1]
]

def_q = 10;

update = true;

dialogue = [			
			//0
				
				//Text
				[
					//0
					"Hey sis, what's up?",
					["Talk", "Quests"],
					//2
					"Wanna kill some slimes?",
					["Yeah", "Nah"],
					"Kill three blue ones and come back.",
					"Aight.",
					//6
					"I got your boots.",
					"Thanks. Now piss off.",
					//8
					"Slimes dealt with.",
					"Yeah, fuck slimes.",
					//10
					"Fuck off."
				], 
				//Speakers
				[
					id, 
					oPlayer, 
					id, 
					oPlayer,
					
					id,
					id,
					
					oPlayer,
					id,
					
					oPlayer,
					id,
					
					oPlayer
				],
				//next_line
				[
					0, 
					[10,def_q], 
					
					0, 
					[4,5],
					
					-1,
					-1,
					
					0,
					-1,
					
					0,
					-1,
					
					-1
					
				],
				//Scripts
				[
					-1,
					[-1,-1],
					-1,
					[[[next_stage, quests.more], [accept_quest, quests.more, id], [change_variable, id, "update", true]],-1],
					
					-1,
					-1,
					[[quest_complete, quests.help_a_brother_out], [change_variable, id, "current_quest", -1], [change_variable, id, "current_line", 0]],
					-1,
					[[quest_complete, quests.more], [change_variable, id, "current_quest", -1], [change_variable, id, "current_line", 0]],
					-1
				]
];

current_line = 0;
current_quest = -1;