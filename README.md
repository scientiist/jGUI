# Documentation

# DataTypes

## Vector2D
### Creation:
#### Vector2D.new(number x, number y) : Vector2D
Returns a new Vector2D with the given valuess
### Methods:
#### Vector2D.add(Vector2D x, number y) : Vector2D
#### Vector2D.add(Vector2D x, Vector2D y) : Vector2D
Performs addition on the given arguments and returns a new vector.
#### Vector2D.subtract(Vector2D x, number y) : Vector2D
#### Vector2D.subtract(Vector2D x, Vector2D y) : Vector2D
Performs subtraction on the given arguments and returns a new vector.
#### Vector2D.multiply(Vector2D x, number y) : Vector2D
#### Vector2D.multiply(Vector2D x, Vector2D y) : Vector2D
Performs multiplication on the given arguments and returns a new vector.
#### Vector2D.divide(Vector2D x, number y) : Vector2D
#### Vector2D.divide(Vector2D x, Vector2D y) : Vector2D
Performs division on the given arguments and returns a new vector.

## RGBColor
### Creation:
#### RGBColor.new() : RGBColor
Returns a black, and opaque RGBColor.
#### RGBColor.new(number r, number g, number b) : RGBColor
Returns an opaque RGBColor with the given values.
#### RGBColor.new(number r, number g, number b, number a) : RGBColor
Returns an RGBColor with the given values.


# Classes
All "class" objects are created via ClassName()

## GUIContainer
Main container object for GUI's (All GUIObjects must be children of this container to render)
### Methods:
#### render() : nil
Renders the GUIContainer (use in love.draw only)
#### update(number deltatime) : nil
Updates the GUIContainer (use in love.update only)
#### getChildren() : table<GUIObject>
Returns list of children.

## Frame
Frame object, generally used for the layout of a UI.
### Methods:
#### getBorder() : number
Returns the size in pixels of the border
#### setBorder(number size) : nil
Sets the size in pixels of the border
#### getParent() : GUIObject
Returns the parent object
#### setParent(GUIObject parent) : nil
Sets the parent object
#### getBackgroundColor() : RGBColor
Returns the background color
#### setBackgroundColor(RGBColor color) : nil
Sets a new background color
#### getBorderColor() : RGBColor
Returns the color of the border
#### setBorderColor() : RGBColor
Sets the color of the border
#### getSize() : Vector2D, Vector2D
Returns the offset and scale vector of the frame's size
#### setSize(Vector2D offset, Vector2D scale) : nil
Sets the offset and scale vector of the frame's size
#### getPosition() : Vector2D, Vector2D
Returns the offset and scale vector of the frame's position
#### setPosition(Vector2D offset, Vector2D scale) : nil
Sets the offset and scale vector of the frame's position
#### getAbsolutePosition() : Vector2D
Returns the _actual_ pixel coordinates of the position
#### getAbsoluteSize() : Vector2D
Returns the _actual_ pixel coordinates of the position

## TextLabel
Displays text
Inherits from Frame
### Methods:
#### setText(string text) : nil
Sets the displayed text
#### getText() : string
Returns the text of the frame
#### getTextColor() : RGBColor
Returns the color of text
#### setTextColor(RGBColor color)
Sets the color of text
#### getTextAlign() : string
Gets the alignment of text
#### setTextAlign(string align) : nil
Sets the alignment of text
#### getTextSize() : number
Returns the size of the text
#### setTextSize(number size) : nil
Set the size of the text
#### getFont() : Font
Returns the font
#### setFont(Font font) : nil