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

awful.widget.watch('acpi -b | grep "Battery 0:" ', 15,
                   function(widget, stdout, stderr, exitreason, exitcode)
                     battery_text:set_text(stdout)
                   end
,battery_widget
)

return battery_widget
