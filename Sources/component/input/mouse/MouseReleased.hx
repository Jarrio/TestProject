package component.input.mouse;

import engine.Mouse.MouseButton;

class MouseReleased extends KeyBase<MouseButton> {
    public function new(input:Array<MouseButton>) {
		super(input);
    }
}