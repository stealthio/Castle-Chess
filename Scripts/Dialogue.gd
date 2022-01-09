extends Node2D

export var position_offset = Vector2(0,0)
export var color : Color = Color.white
export var opening_dialogue_chance = 10
export var opening_dialogues : PoolStringArray = []
export var kill_dialogue_chance = 50
export var kill_dialogues: PoolStringArray = []
export var death_dialogue_chance = 50
export var death_dialogues: PoolStringArray = []

func _ready():
	get_parent().connect("on_kill", self, "on_kill")
	get_parent().connect("on_death", self, "on_death")
	if rand_range(0, 100) <= opening_dialogue_chance:
		Helper.show_text_at_position(Helper.get_random_from_array(opening_dialogues), get_parent().global_position + position_offset, 3.0, color)

func on_death():
	if rand_range(0, 100) <= death_dialogue_chance:
		Helper.show_text_at_position(Helper.get_random_from_array(death_dialogues), get_parent().global_position + position_offset, 3.0, color)

func on_kill(pos):
	if rand_range(0, 100) <= kill_dialogue_chance:
		Helper.show_text_at_position(Helper.get_random_from_array(kill_dialogues), pos + position_offset, 3.0, color)