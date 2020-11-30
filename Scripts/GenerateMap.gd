extends Node2D

class_name GenerateMap
var sizeMapCell : Vector2 setget setSizeMapCell,getSizeMapCell;
var sizeCellPixel : Vector2 setget setSizeCellPixel,getSizeCellPixel;
var sizeMapPixel : Vector2;
var layer1 : TileMap;
var layer2 : TileMap;
var brickPosition : PoolVector2Array

var brick = preload("res://Scenes/Prefabs/Brick.tscn")

enum Cell{OBSTANCE = 0, GROUND = 2, BRICK = 3}
func _init(_sizeMapCell : Vector2 = Vector2(41,21)):
	sizeMapCell = _sizeMapCell;
	pass
	
func _ready():	
	layer1 = $Layer1;
	layer2 = $Layer2;
	print(layer1.get_cell(0,0))
	layer1.position = Vector2.ZERO;
	layer2.position = Vector2.ZERO;
	sizeCellPixel = layer1.cell_size;
	sizeMapPixel = Vector2(sizeMapCell.x*sizeCellPixel.x,sizeMapCell.y*sizeCellPixel.y);
	generateMap();
	pass 
	
func setSizeMapCell( _sizeMapCell : Vector2):
	sizeMapCell = _sizeMapCell;
	sizeMapPixel = Vector2(sizeMapCell.x*sizeCellPixel.x,sizeMapCell.y*sizeCellPixel.y);
	pass


func getSizeMapCell()->Vector2:
	return sizeMapCell;
	
func setSizeCellPixel( _sizeCellPixel : Vector2):
	sizeCellPixel = _sizeCellPixel;
	sizeMapPixel = Vector2(sizeMapCell.x*sizeCellPixel.x,sizeMapCell.y*sizeCellPixel.y);
	pass
	

func getSizeCellPixel()->Vector2:
	return sizeCellPixel;



func generateMap()->bool:
	generateObstance();
	generateBrick();
	generateGround();
	return true;
	pass
	
func generateObstance()->bool:
	for i in range (sizeMapCell.x):
		layer1.set_cell(i,0,Cell.OBSTANCE)
		layer1.set_cell(i,sizeMapCell.y-1,Cell.OBSTANCE);
	
	for i in range  (sizeMapCell.y):
		layer1.set_cell(0,i,Cell.OBSTANCE)
		layer1.set_cell(sizeMapCell.x-1,i,Cell.OBSTANCE);
	for i in range (sizeMapCell.x):
		for j in range (sizeMapCell.y):
			if(i % 2 == 0 && j % 2 == 0):
				layer1.set_cell(i,j,Cell.OBSTANCE);
	return true;
	pass

func isDuplicatedInBrick(pos : Vector2)->bool:
	for i in brickPosition:
		if(pos == i):
			return true;
		pass
	return false;
	pass
	
func randomPositionBrick():
	var numOfBrick = 0;
	while(numOfBrick < 0.1 * float(sizeMapCell.x*sizeMapCell.y)):
		randomize();
		var pos = Vector2(randi() % int(sizeMapCell.x),randi() % int(sizeMapCell.y));
		if(layer1.get_cell(pos.x,pos.y) == -1):
			if(!isDuplicatedInBrick(pos) && pos != Vector2(1,1)):
				brickPosition.push_back(pos);
				numOfBrick += 1;
			else:
				continue;	
	
func generateBrick()->bool:
	randomPositionBrick();
	while(brickPosition.size() > 0):
		var brickObj = brick.instance(); 
		var vecAdd  =  Vector2(float(brickPosition[0].x+0.5) * sizeCellPixel.x,float(brickPosition[0].y+0.5) * sizeCellPixel.y)
		vecAdd *= layer1.scale.x;
		brickObj.global_position = layer1.global_position + vecAdd;
		add_child(brickObj)
		layer1.set_cell(brickPosition[0].x,brickPosition[0].y,Cell.OBSTANCE);
		brickPosition.remove(0);
	return true;
	pass
	pass
	
func generateGround()->bool:
	for i in range (sizeMapCell.x):
		for j in range (sizeMapCell.y):
			if(layer1.get_cell(i,j) == -1):
				layer2.set_cell(i,j,Cell.GROUND);
	return true;

func whenBrickBroken(pos : Vector2):
	pos = pos - 0.5*sizeCellPixel;
	pos.x = int(pos.x / sizeCellPixel.x);
	pos.y = int(pos.y / sizeCellPixel.y);
	layer1.set_cell(pos.x,pos.y,-1);
	layer2.set_cell(pos.x,pos.y,Cell.GROUND);
	
