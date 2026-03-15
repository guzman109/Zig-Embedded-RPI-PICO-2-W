const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const gpio = rp2xxx.gpio;
const time = rp2xxx.time;

pub fn main() !void {
    var pins: [10]gpio.Pin = undefined;

    setup(&pins);
    flowing_light(&pins);
}

fn setup(pins: *[10]gpio.Pin) void {
    const pin_numbers = [_]u9{ 16, 17, 18, 19, 20, 21, 22, 26, 27, 28 };
    for (pin_numbers, 0..) |n, i| {
        pins[i] = gpio.num(n);
        pins[i].set_function(.sio);
        pins[i].set_direction(.out);
    }
}

fn flowing_light(pins: *[10]gpio.Pin) void {
    var i: usize = 0;
    while (true) : (i = 0) {
        while (i < pins.len) : (i += 1) {
            pins[i].put(1);
            time.sleep_ms(100);
            pins[i].put(0);
        }
        i -= 1;
        while (i > 0) {
            i -= 1;
            pins[i].put(1);
            time.sleep_ms(100);
            pins[i].put(0);
        }
    }
}
