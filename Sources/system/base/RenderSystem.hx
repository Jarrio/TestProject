package system.base;

import ecx.System;
import kha.Font;
import ecx.Family;
import kha.Color;
import ecx.Wire;
import component.display.Display;
import component.Position;

typedef Text = component.display.Text<Font, Color>;

class RenderSystem extends System {
	var display:Wire<Display<Color>>;
	var text:Wire<Text>;
	var position:Wire<Position>;	
	var display_id:Family<Display<Color>, Position, (Text)>;	
	// var position_id:Family<Position>;	

	public function new () {}

    override function initialize() {
    }

	override function update() {

		if (Game.framebuffer == null) {
			return;
		}

		var graphics = Game.framebuffer.g2;
		graphics.begin();

		for (node in this.display_id) {
			var position = this.position.get(node);
			var display = this.display.get(node);
			
			graphics.color = display.color;
			trace(graphics.color);
			graphics.fillRect(position.x, position.y, display.width, display.height);		
		}

		graphics.end();
	}

}