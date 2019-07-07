package system.base;

import kha.graphics2.Graphics;
import kha.Framebuffer;
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

	var position_a = null;
	var display_a = null;
	
	public function render(graphics:Graphics) {
		graphics.begin();

		for (node in this.display_id) {
			position_a = this.position.get(node);
			display_a = this.display.get(node);
			
			graphics.color = display_a.color;
			trace(graphics.color);
			graphics.fillRect(position_a.x, position_a.y, display_a.width, display_a.height);		
		}

		graphics.end();
	}

}