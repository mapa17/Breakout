extends Node2D

const welcome = preload('res://Scenes/Welcome_Screen.xscn')

const small_border = preload('res://SubScenes/small_border.tscn')
const big_border = preload('res://SubScenes/big_border.tscn')

const Tutorials = [preload('res://Scenes/Level1.tscn.xscn'),
	preload('res://Scenes/Level2.tscn.xscn'),
	preload('res://Scenes/Level3.tscn.xscn'),
	preload('res://Scenes/Level4.tscn.xscn'),
	preload('res://Scenes/Tutorial_End.tscn.xscn')]
	
const Game_Levels = [preload('res://Scenes/Game_Level1.xscn'),
	preload('res://Scenes/Game_End.xscn')] 
#const Level1 = preload('res://Scenes/Level3.tscn.xscn')

var Levels
var new_scene_origin

var score = 0 setget set_score
export var current_level = 0

func _ready():
	# Load the first Level
	#print('Loading Level %d ...' % (current_level + 1))
	#load_scene(Levels[current_level])
	new_scene_origin = Vector2(200, 280)
	load_scene(welcome)

func start_game(caller):
	new_scene_origin = Vector2(0, 0)
	if has_node('small_border'):
		get_node('small_border').queue_free()
	load_scene(big_border)
	current_level = -1
	Levels = Game_Levels
	print('Starting Game!')
	level_solved(caller)

		
func start_tutorial(caller):
	new_scene_origin = Vector2(200, 280)
	load_scene(small_border)
	current_level = -1
	Levels = Tutorials
	level_solved(caller)
	print('Starting tutorial!')
	

func load_scene(scene_path):
	var new_scene = scene_path.instance()
	new_scene.set_pos(new_scene_origin)
	add_child(new_scene)

func set_score(value):
	score = value
	get_node('Score').set_text('Score: ' + str(score))

func level_solved(level):
	print('Solved level %d' % current_level)
	level.queue_free()
	
	# Remove all flying balls
	for child in get_children():
		if child.is_in_group('Ball'):
			child.queue_free()

	current_level += 1
	print('Loading Level %d ...' % (current_level + 1))
	load_scene(Levels[current_level])
	