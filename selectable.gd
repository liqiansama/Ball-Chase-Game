extends Node
@onready var main_mesh = $MeshInstance3D


func ray_select():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width",10)
	
func ray_deselect():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width",0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
