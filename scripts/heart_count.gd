extends CanvasLayer

@onready var bars = $Bar

var current_health = 4:
	set = set_health

func _ready():
	current_health = 3

func set_health(value):
	current_health = clamp(value, 0, 10)
	#health_label.text = "Current Health : %s" % current_health
	for bar in bars.get_children():
		bar.update_health(current_health)
		
func add_heart():
	current_health += 1

func minus_heart():
	current_health -= 1
