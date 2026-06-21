extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 42069

var peer: ENetMultiplayerPeer

# Called when the node enters the scene tree for the first time.
func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_client() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
