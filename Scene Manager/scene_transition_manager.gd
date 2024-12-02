extends Node

const SCENE_TRANSITION_RECT = preload("res://Scene Manager/scene_transition_rect.tscn")
var transition_ins: Node

func transition_from(animation: CompressedTexture2D):
	transition_ins = SCENE_TRANSITION_RECT.instantiate()
	get_tree().root.add_child(transition_ins)
	get_tree().current_scene = transition_ins
	await transition_ins.transition_from(animation)

func transition_to(animation: CompressedTexture2D):
	await transition_ins.transition_to(animation)
	transition_ins.queue_free()
