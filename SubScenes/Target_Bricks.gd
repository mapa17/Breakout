extends Node2D

func _ready():
	pass

func free_brick():
	if get_child_count() == 1:
		print('All target bricks are gone!')
		get_parent().freed_all_bricks()
	else:
		print('Still have %d bricks!' % (get_child_count()))
	