const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const gpio = rp2xxx.gpio;
const time = rp2xxx.time;

// const pin_config = rp2xxx.pins.GlobalConfiguration {
//     .GPIO15 = .{
//         .name = "led",
//         .direction = .out,
//     }
// };

pub fn main() !void {
    // const pins = pin_config.apply();
    const led = gpio.num(15);
    led.set_function(.pwm);
    led.set_direction(.out);

    while (true) {
        var i = 0;
        while (i < 255) : (i += 1) {
            // pins.led.
        }
    }

}

