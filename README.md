# Documentation

# DataTypes

## Vector2D
### Creation:
Vector2D.new(number x, number y)
### Methods:
#### Vector2D.add(Vector2D x, number y) : Vector2D
#### Vector2D.add(Vector2D x, Vector2D y) : Vector2D
Performs addition on the given arguments and returns a new vector.
#### Vector2D.subtract(Vector2D x, number y) : Vector2D
#### Vector2D.subtract(Vector2D x, Vector2D y) : Vector2D

#### Vector2D.multiply(Vector2D x, number y) : Vector2D
#### Vector2D.multiply(Vector2D x, Vector2D y) : Vector2D

#### Vector2D.divide(Vector2D x, number y) : Vector2D
#### Vector2D.divide(Vector2D x, Vector2D y) : Vector2D

## RGBColor
### Creation:
RGBColor.new()
RGBColor.new(number r, number g, number b)
RGBColor.new(number r, number g, number b, number a)


# Classes
All "class" objects are created via ClassName()

## GUIContainer
### Methods:
#### render() : nil
Renders the GUIContainer (use in love.draw only)
#### update(number deltatime) : nil
Updates the GUIContainer (use in love.update only)
#### getChildren() : table<GUIObject>
Returns list of children.

## Frame
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