extends Node

@export var quiz : QuizTheme
@export var  color_right : Color
@export var color_wrong : Color

var buttons: Array[Button]
var index: int 
var correct: int 


@onready var question_text: Label = $Content/QuestionInfo/QuestionText
@onready var question_image : TextureRect = $Content/QuestionInfo/ImageHolder/QuestionImage
func _ready() -> void:
	for button in $Content/QuestionHolder.get_children():
		buttons.append(button)
		
	load_quiz()



func load_quiz() -> void:
	question_text.text = quiz.theme[index].question_info
	
	var options = quiz.theme[index].options
	for i in buttons.size():
		buttons[i].text = options[i]
		buttons[i].pressed.connect(_button_answer.bind(buttons[i]))
		
func _button_answer(button) -> void:
	if quiz.theme[index].correct == button.text:
		button.modulate = color_right
	else:
		button.modulate = color_wrong
	
	
