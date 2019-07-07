package;

import component.input.keyboard.KeyJustReleased;
import component.input.keyboard.KeyJustPressed;
import component.input.keyboard.KeyReleased;
import kha.input.KeyCode;
import component.Movable;
import component.Position;
import component.input.keyboard.KeyPressed;

import kha.Font;
import ecx.Engine;
import kha.Color;
import component.display.Display;
import ecx.World;
import ecx.WorldConfig;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import system.base.KeyboardInputSystem;
import system.base.RenderSystem;
// import system.base.MovementSystem;
import system.GameSystem;

typedef Text = component.display.Text<Font, Color>;

class Main {
	public static var ecx:ECXLoader;
	public static function main() {
		Game.refresh_rate = 1 / 60;
		System.start({title: "Project", width: 600, height: 400}, function (window) {
			Game.window = window;
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				// Scheduler.TI
				ecx = new ECXLoader();
				Scheduler.addTimeTask(() -> ecx.updateSystems(), 0, Game.refresh_rate);
				System.notifyOnFrames((frames) -> Game.framebuffer = frames[0]);
			});
		});
	}
}

class ECXLoader {
	public var world:World;
	public function new():Void {
		var config = new WorldConfig();
		/**
		 * Internal systems
		 */
		config.add(new RenderSystem());
		config.add(new KeyboardInputSystem(), 1);

		/**
		 * User systems
		 */
		config.add(new GameSystem());
		
		/**
		 * Components
		 */
		config.add(new Text());
		config.add(new Movable());
		config.add(new Position());
		config.add(new Display<Color>());
		config.add(new KeyPressed<KeyCode>());
		config.add(new KeyReleased<KeyCode>());
		config.add(new KeyJustPressed<KeyCode>());
		config.add(new KeyJustReleased<KeyCode>());


		this.world = Engine.createWorld(config);
	}

	public function updateSystems():Void {
		for(system in world.systems()) {
			@:privateAccess system.update();
			world.invalidate();
		}		
	}
}