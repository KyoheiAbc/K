class Puyo extends Sprite2D:
    var colorIndex: int
    var moveVector: Vector2

    func _init(pos: Vector2, colIndex: int):
        position = pos
        colorIndex = colIndex
        texture = load("res://Circle.png")
        scale = Vector2(100 / 256.0, 100 / 256.0) # Assuming Circle.png is 256x256

        moveVector = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() # Random initial direction
        match colorIndex:
            0:
                modulate = Color(1, 0, 0) # Red
            1:
                modulate = Color(0, 1, 0) # Green
            2:
                modulate = Color(0, 0, 1) # Blue
            3:
                modulate = Color(1, 1, 0) # Yellow
        # Additional initialization can be done here
    # Additional methods for Puyo can be added here

    func update(delta, puyoList: Array):
        position += moveVector * delta * 500 # Move at 100 pixels per second
        if position.x < 0 or position.x > get_viewport().size.x:
            moveVector.x *= -1 # Bounce off the horizontal edges
        if position.y < 0 or position.y > get_viewport().size.y:
            moveVector.y *= -1 # Bounce off the vertical edges
        

        if puyoList.size() > 1:
            for other_puyo in puyoList:
                if other_puyo != self and position.distance_to(other_puyo.position) < 50: # Collision detection
                    moveVector = - moveVector # Bounce off other Puyos
                    break
