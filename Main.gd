extends Node3D

var ray_origin = Vector3()
var ray_target = Vector3()

func _physics_process(delta):
	
	var mouse_position = get_viewport().get_mouse_position()
	#print("Mouse Position: ", mouse_position)
	
	ray_origin = $camera.project_ray_origin(mouse_position)
	#print("ray_origin: ", mouse_position)
	ray_target = ray_origin + $Camera.project_ray_normal(mouse_position) * 2000
	
	var space_state = get_world_3d().direct_space_state
	var intensection = space_state.intersect_ray(ray_origin)
	
	if not intensection.emty():
		var pos = intensection.position
		$Player.look_at(pos, Vector3.UP)
