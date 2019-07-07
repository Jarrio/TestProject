package system.base;

import component.Vector.VectorData;
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
	var display_objects:Family<Display<Color>, Position, (Text)>;	

	/**
	 * Cache vars
	 */

	var position_data:VectorData;
	var display_data:DisplayData<Color>;

	public function new () {}

    override function initialize() {}
	
	public function render(graphics:Graphics) {
		graphics.begin();

		for (node in this.display_objects) {
			var position_data = this.position.get(node);
			var display_data = this.display.get(node);
			
			graphics.color = display_data.color;
			graphics.fillRect(position_data.x, position_data.y, display_data.width, display_data.height);		
		}

		graphics.end();
	}

}