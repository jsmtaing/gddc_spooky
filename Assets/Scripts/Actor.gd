extends Node2D

var remainder = Vector2.ZERO

# Explanation as to why we even need the _exact functions:
# i wanted to normalize movement to whole integers for ease.
func move_x(amount):
	remainder.x += amount
	var move = round(remainder.x)
	if (move != 0):
		remainder.x -= move
		move_x_exact(move)
		
func move_x_exact(amount):
	# The direction to move, pixel by pixel
	var step = sign(amount)
	while (amount != 0):
		global_position.x += step
		amount -= step
	
# Note: we are faking collision on the y scale
func move_y(amount):
	remainder.y += amount
	var move = round(remainder.y)
	if (move != 0):
		remainder.y -= move
		move_y_exact(move)
		
func move_y_exact(amount):
	# The direction to move, pixel by pixel
	var step = sign(amount)
	while (amount != 0):
		global_position.y += step
		amount -= step
		if (global_position.y >= 160):
			global_position.y = 160

