function enum_init() {
	enum states {
		normal,
		jump,
		prep,
		cutscene,
		attack,
		air_attack,
		hit,
		block,
		death,
		seek,
		charge,
		shoot,
		sheath,
		taunt,
		dash,
		sprint,
		ledge
	}

	enum attacks {
		first,
		second,
		third
	}

	enum item {
		none,
		medicine,
		sword,
		bow,
		helmet,
		platemail,
		shirt,
		belt,
		boots,
		woodswrd,
		bucket,
		chair,
		picture,
		axe,
		potion,
		starfish,
		mushroom,
		height
	}

	enum skills {
		jump,
		spd,
		pwr
	}

	enum equipment {
		none,
		healing,
		weapon,
		range,
		head,
		body,
		hands,
		feet,
		belt
	}

	enum type {
		kill,
		fetch,
		escort,
		travel,
		collect,
		unique,
		talk
	}

	enum quests {
		help_a_brother_out,
		more
	}

	enum event {
		back_to_basics,
		quest_2,
		dialogue,
		slime_dead,
		blue_death,
		green_death,
		help_a_brother_out
	}


}
