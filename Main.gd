extends Node

const Puyo = preload("res://Puyo.gd").Puyo

# Puyo Array
var PuyoList: Array[Puyo]

func _init():
	PuyoList = []
	var puyo_instance = Puyo.new(Vector2(500, 250), 1)
	add_child(puyo_instance)
	PuyoList.append(puyo_instance)
	

func _process(delta):
	for puyo in PuyoList:
		puyo.update(delta, PuyoList)


func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			var touch_pos = event.position
			var new_puyo = Puyo.new(touch_pos, randi() % 4) # Random color index
			add_child(new_puyo)
			PuyoList.append(new_puyo)
