const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;

const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO13 = .{ .name = "button", .direction = .in, .pull = .down },
    .GPIO15 = .{
        .name = "led",
        .direction = .out,
    },
};

var led_state: bool = false;

pub fn main() !void {
    const pins = pin_config.apply();
    while (true) {
        if (pins.button.read() == 1) {
            time.sleep_ms(25);
            if (pins.button.read() == 1) {
                reverseGPIO(pins.led);
            }
        }
        while (pins.button.read() == 1) {
            continue;
        }
    }
}

fn reverseGPIO(pin: rp2xxx.gpio.Pin) void {
    led_state = !led_state;
    pin.put(if (led_state) 1 else 0);
}
