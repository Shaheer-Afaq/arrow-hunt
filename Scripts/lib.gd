extends Node

func delete_after_delay(node: Node, time: float = 2.0):
	var deleteTimer = Timer.new()
	deleteTimer.wait_time = time
	deleteTimer.one_shot = true
	node.add_child(deleteTimer)
	deleteTimer.start()
	deleteTimer.timeout.connect(func():node.queue_free())
