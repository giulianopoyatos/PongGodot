extends Node2D


# Bola
@onready var bola : Area2D = $"../Bola"

# Efeito Sonoro
@onready var som_impacto_gol : AudioStreamPlayer = $SomImpactoGol

# Pontuações
var pontuacao_jogador1 : int = 0
var pontuacao_jogador2 : int = 0

# UI
@onready var texto_pontuacao_jogador1 : Label = $"../UI/PainelDePontuacao/TextoPontuacaoJogador1"
@onready var texto_pontuacao_jogador2 : Label = $"../UI/PainelDePontuacao/TextoPontuacaoJogador2"


func _process(delta):
	receber_inputs()


func receber_inputs() -> void:
	# Reinicia a partida
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
	
	# Sai do jogo
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()


func _on_gol_1_area_entered(area):
	# Chamado quando o Jogador 2 marca um gol
	
	som_impacto_gol.play()
	pontuacao_jogador2 += 1
	texto_pontuacao_jogador2.text = str(pontuacao_jogador2)
	bola.rodar_timer()


func _on_gol_2_area_entered(area):
	# Chamado quando o Jogador 1 marca um gol
	
	som_impacto_gol.play()
	pontuacao_jogador1 += 1
	texto_pontuacao_jogador1.text = str(pontuacao_jogador1)
	bola.rodar_timer()
