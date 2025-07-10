extends CharacterBody3D
class_name Player

@export var move_speed : float = 10.0
@export var rotate_speed : float = 3.0

func _physics_process(delta: float) -> void:
	var z_movement : float = Input.get_action_strength("Forward") - Input.get_action_strength("Backward")
	var rotate : float = Input.get_action_strength("Left") - Input.get_action_strength("Right")
	rotation.y += rotate * rotate_speed * delta
	var direction : Vector3 = Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
	var motion : Vector3 = direction * z_movement * delta * move_speed
	move_and_collide(motion)
	pass
