package system;

import component.input.keyboard.KeyJustPressed;
import component.input.keyboard.KeyJustReleased;
import ecx.Wire;
import kha.Color;
import ecx.Family;
import ecx.System;
import kha.input.KeyCode;
import component.Position;
import component.Movable;
import component.display.Display;
import component.input.keyboard.KeyPressed;

class GameSystem extends System {
	// var square:State;
	var position:Wire<Position>;
	var movable:Wire<Movable>;
	var keypressed:Wire<KeyPressed<KeyCode>>;
	var key_just_pressed:Wire<KeyJustPressed<KeyCode>>;
	var display:Wire<Display<Color>>;
	var objects:Family<Movable, Display<Color>, KeyPressed<KeyCode>, Position, KeyPressed<KeyCode>>;
	var demo_state:Family<Display<Color>, KeyJustPressed<KeyCode>>;

    public function new() {}

	override function initialize() {
		var x = Game.window.width / 2;
		var y = Game.window.height / 2;
		var entity = this.world.create();
		this.movable.create(entity).init();
		this.position.create(entity).init(x - 25, y - 25);
		this.display.create(entity).init(50, 50, Color.White);
		this.keypressed.create(entity).init([Up, Down, Left, Right]);
		this.key_just_pressed.create(entity).init([Up, Down, Left, Right]);
		var entity = this.world.create();
		this.movable.create(entity).init();
		this.position.create(entity).init(50, 50);
		this.display.create(entity).init(50, 50, Color.Purple);
		this.keypressed.create(entity).init([Up, Down, Left, Right]);
		this.key_just_pressed.create(entity).init([Up, Down, Left, Right]);
	}

	var position_a = null;
	var movable_a = null;
	var display_a = null;
	var key_a = null;
	var just_pressed_a = null;	

	override function update() {
		for (entity in this.objects) {
			position_a = this.position.get(entity);
			movable_a = this.movable.get(entity).value;  
			display_a = this.display.get(entity);  
			key_a = this.keypressed.get(entity);
			just_pressed_a = this.key_just_pressed.get(entity);

			if (!movable_a) {
				continue;
			}

			for (key => state in just_pressed_a.active) {
				if (!state) {
					display_a.color = display_a.init_color;
					continue;
				}

				display_a.color = switch (key) {
					case Left: Color.Red;
					case Right: Color.Red;
					case Down: Color.Red;
					case Up: Color.Red;
					default: Color.Transparent;
				}

				if (key == Left) {
					trace('Left: ' + display_a.color);
				}
				if (key == Right) {
					trace('Right: ' + display_a.color);
				}
				if (key == Up) {
					trace('Up: ' + display_a.color);
				}
				if (key == Down) {
					trace('Down: ' + display_a.color);
				}				
			}

			for (key => state in key_a.active) {
				if (!state) {
					continue;
				}
				switch (key) {
					case Left: position_a.x -= 2;
					case Right: position_a.x += 2;
					case Up: position_a.y -= 2;
					case Down: position_a.y += 2;
					default: {}
				}
			}	
		}
	}
}