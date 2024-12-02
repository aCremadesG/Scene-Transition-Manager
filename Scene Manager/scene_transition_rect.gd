extends CanvasLayer
class_name SceneTransition

@onready var color_rect = $ColorRect

#List of images used on the shader transition
const mask_dict = {
	"Curtain": preload("res://Masks/curtain.png"),
	"Center": preload("res://Masks/from_center.png")
}

var tween: Tween

func transition_from(animation: CompressedTexture2D):
	if tween:
		tween.kill()
	tween = create_tween().bind_node(color_rect).set_trans(Tween.TRANS_LINEAR)
	tween.tween_method(set_shader_value, 1.0, 0.0, 0.2)
	await tween.finished

func transition_to(animation: CompressedTexture2D):
	if tween:
		tween.kill()
	tween = create_tween().bind_node(color_rect).set_trans(Tween.TRANS_LINEAR)
	tween.tween_method(set_shader_value, 0.0, 1.0, 0.2)
	await tween.finished

func set_shader_value(value: float):
	color_rect.material.set_shader_parameter("cutoff", value)
