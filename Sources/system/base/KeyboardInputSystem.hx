package system.base;

import ecx.Wire;
import ecx.System;
import ecx.Family;
// import haxe.io.Input;

import kha.input.KeyCode;
import kha.input.Keyboard;

import component.input.keyboard.KeyPressed;
import component.input.keyboard.KeyReleased;
import component.input.keyboard.KeyJustPressed;
import component.input.keyboard.KeyJustReleased;

class KeyboardInputSystem extends System {
	public var pressed:Wire<KeyPressed<KeyCode>>;
	public var active_pressed:Family<KeyPressed<KeyCode>>;
	
	public var just_pressed:Wire<KeyJustPressed<KeyCode>>;
	public var active_just_pressed:Family<KeyJustPressed<KeyCode>>;

	public var released:Wire<KeyReleased<KeyCode>>;
	public var active_released:Family<KeyReleased<KeyCode>>;

	public var just_released:Wire<KeyJustReleased<KeyCode>>;
	public var active_just_released:Family<KeyJustReleased<KeyCode>>;
	
	public function new() {}
	
	override function initialize():Void {
		Keyboard.get().notify(this.keyDown, this.keyUp, null);
	}

	override function update() {
		super.update(); 
		for (entity in this.active_just_pressed) {
			var keys = this.just_pressed.get(entity);
			for (key in keys.active.keys()) {
				keys.active.set(key, false);
			}			
		}

		for (entity in this.active_just_released) {
			var keys = this.just_released.get(entity);
			for (key in keys.active.keys()) {
				keys.active.set(key, false);
			}		
		}
	}

	private function keyUp(input:KeyCode):Void {
		for (entity in this.active_just_released) {
			var keys = this.just_released.get(entity);
			for (key => state in keys.active) {
				if (key != input || state) {
					continue;
				}
				// trace("Just Released: " + input);
				keys.active.set(key, true);
			}
		}

		for (entity in this.active_released) {
			var keys = this.released.get(entity);
			for (key in keys.active.keys()) {
				if (key != input) {
					continue;
				}
				keys.active.set(key, true);
			}
		}

		for (entity in this.active_pressed) {
			var keys = this.pressed.get(entity);
			for (key in keys.active.keys()) {
				if (key != input) {
					continue;
				}
				keys.active.set(key, false);
			}
		}		
	}

	private function keyDown(input:KeyCode):Void {
		for (entity in this.active_just_pressed) {
			var keys = this.just_pressed.get(entity);
			for (key => state in keys.active) {
				if (key != input || state) {
					continue;
				}
				// trace("Just Pressed: " + input);

				keys.active.set(key, true);
			}
		}

		for (entity in this.active_pressed) {
			var keys = this.pressed.get(entity);
			for (key in keys.active.keys()) {
				if (key != input) {
					continue;
				}
				keys.active.set(key, true);
			}
		}

		for (entity in this.active_released) {
			var keys = this.released.get(entity);
			for (key => state in keys.active) {
				if (key != input || state) {
					continue;
				}
				keys.active.set(key, false);
			}
		}		
	}
}