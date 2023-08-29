from flask_socketio import emit

from .extensions import socketio

@socketio.on("new_inject")
def handle_new_inject(data):
    emit("add_new_inject", data, broadcast=True)

@socketio.on("reset_main_timer")
def handle_timer_sync():
    emit("main_timer_sync", broadcast=True)