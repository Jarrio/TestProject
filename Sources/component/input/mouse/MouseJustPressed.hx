package component.input.mouse;

import engine.Mouse.MouseButton;

class MouseJustPressed extends KeyBase<MouseButton> {
    public function new(input:Array<MouseButton>) {
		super(input);
    }
}