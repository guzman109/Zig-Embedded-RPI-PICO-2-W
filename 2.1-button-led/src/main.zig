const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const gpio = rp2xxx.gpio;

const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO13 = .{ .name = "button", .direction = .in, .pull = .down },
    .GPIO15 = .{
        .name = "led",
        .direction = .out,
    },
};

pub fn main() !void {
    const pins = pin_config.apply();
    while (true) {
        if (pins.button.read() == 1) {
            pins.led.put(0);
        } else {
            pins.led.put(1); // turn led on when button pressed.
        }
    }
}
