# Documentation

# DataTypes

## Vector2D
### Creation:
Vector2D.new(number x, number y)

All "class" objects are created via ClassName()
# Classes

## GUIContainer
### Methods:
#### render() : nil
Renders the GUIContainer (use in love.draw only)
#### update(number deltatime) : nil
Updates the GUIContainer (use in love.update only)
####getChildren() : table<GUIObject>
Returns list of children.

## Frame
### Methods:
#### getBorder() : Vector2D