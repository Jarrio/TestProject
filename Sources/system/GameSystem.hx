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
	private var position:Wire<Position>;
	private var movable:Wire<Movable>;
	private var keypressed:Wire<KeyPressed<KeyCode>>;
	private var display:Wire<Display<Color>>;
	private var objects:Family<Movable, Display<Color>, KeyPressed<KeyCode>, Position>;

    public function new() {}

	override function initialize() {
		var x = Game.window.width / 2;
		var y = Game.window.height / 2;
		var entity = this.world.create();

		this.movable.create(entity).init();
		this.position.create(entity).init(x - 25, y - 25);
		this.display.create(entity).init(50, 50, Color.White);
		this.keypressed.create(entity).init([Up, Down, Left, Right]);
	}	

	override function update() {
		for (entity in this.objects) {
			var position = this.position.get(entity);
			var movable = this.movable.get(entity).value;  
			var display = this.display.get(entity);  
			var key = this.keypressed.get(entity);

			if (!movable) {
				continue;
			}

			for (key => state in key.active) {
				if (!state) {
					continue;
				}
				
				display.color = switch (key) {
					case Left: Color.Magenta;
					case Right: Color.Blue;
					case Down: Color.Yellow;
					case Up: Color.Pink;
					default: Color.Transparent;
				}

				switch (key) {
					case Left: position.x -= 2;
					case Right: position.x += 2;
					case Up: position.y -= 2;
					case Down: position.y += 2;
					default: {}
				}
			}	
		}
	}
}