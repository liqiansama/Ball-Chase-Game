extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var agent = $NavigationAgent3D
var target:Vector3

func _ready() -> void:
	set_walk_target(get_node("/root/Node3D/Ball"))
	

func set_walk_target(targ):
	agent.target_position = targ.position
	target = targ.position

func _process(delta: float) -> void:
	set_walk_target(get_node("/root/Node3D/Ball"))


func _physics_process(delta: float) -> void:
	if position.distance_to(target) > 2:
		var next_point = agent.get_next_path_position()
		next_point = self.position.y
		
		var looking = self.transform.looking_at(next_point)
		var a = Quaternion(looking.basis)
		var b = Quaternion(basis)
		var c = b.slerp(a, .04)
		transform.basis = Basis(c)
		
		self.look_at(next_point)
		
		velocity = -self.transform.basis.z * SPEED
	else:
		velocity = Vector3(0,0,0)
	move_and_slide()
