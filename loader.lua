package.path = ';jGUI/?.lua;' .. package.path

GUIContainer = require("objects/GUIContainer")
Frame = require("objects/Frame")
Label = require("objects/Label")
Button = require("objects/Button")
InputLabel = require("objects/InputLabel")
ImageLabel = require("objects/ImageLabel")

Vector2D = require("datatypes/Vector2D")
RGBColor = require("datatypes/RGBColor")

print("jGUI library loaded!")