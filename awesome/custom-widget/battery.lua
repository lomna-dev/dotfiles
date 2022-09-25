local wibox = require("wibox")
local awful = require("awful")

-- Get the text box
local battery_text = wibox.widget{
  font = "Play 9",
  widget = wibox.widget.textbox,
}

--Make the widget
local battery_widget = wibox.widget.background()
battery_widget:set_widget(battery_text)
battery_widget:set_bg("#000000") --The background color
battery_widget:set_fg("#ffffff") --The text color

awful.widget.watch("acpi -b", 5,
                   function(widget, stdout, stderr, exitreason, exitcode)
                     local bat = string.match(stdout, "[A-Za-z]+ [A-Za-z]+, [0-9]+")
                     battery_text:set_text(bat)
                   end
,battery_widget
)

return battery_widget
