# Documentation

# DataTypes

## Vector2D
## Creation:
```lua
    Vector2D.new(x, y) -- returns new object
```

All "class" objects are created via ClassName()
# Classes

## GUIContainer
## Methods:
### render() : nil
Renders the GUIContainer (use in love.draw only)
### update(number deltatime) : nil
Updates the GUIContainer (use in love.update only)
### getChildren() : table<GUIObject>
Returns list of children.

## Fram class
## Methods:
### getBorder() : Vector2D