# Zig Embedded — Raspberry Pi Pico 2 W

A collection of embedded projects for the **Raspberry Pi Pico 2 W** (RP2350) written in Zig, using the [MicroZig](https://github.com/ZigEmbeddedGroup/microzig) framework.

## Projects

| # | Project | Concepts |
|---|---------|----------|
| 1 | [Blinky](#1-blinky) | GPIO output, timing |
| 2.1 | [Button LED](#21-button-led) | GPIO input, pull-down resistor |
| 2.2 | [Mini Table Lamp](#22-mini-table-lamp) | Debouncing, toggle state |
| 3 | [Flowing Light](#3-flowing-light) | Multiple GPIOs, animation loop |
| 4.1 | [Breathing LED](#41-breathing-led) | PWM (in progress) |

---

### 1. Blinky

Blinks an LED connected to **GPIO15** every 250ms. The classic "Hello, World!" of embedded systems.

```
GPIO15 → LED → GND
```

---

### 2.1. Button LED

Holds an LED on while a button is held down. Uses a pull-down resistor so the pin reads `0` when the button is unpressed.

```
GPIO13 → Button → 3.3V   (pull-down)
GPIO15 → LED → GND
```

---

### 2.2. Mini Table Lamp

Each button press toggles the LED on or off. Includes a 25ms debounce delay to filter out contact noise, and blocks until the button is released before accepting the next press.

```
GPIO13 → Button → 3.3V   (pull-down)
GPIO15 → LED → GND
```

---

### 3. Flowing Light

Ten LEDs animate in a back-and-forth wave pattern, each lit for 100ms before moving to the next.

```
GPIO16–22, GPIO26–28 → LEDs → GND   (10 LEDs total)
```

---

### 4.1. Breathing LED

PWM-based LED that smoothly fades in and out. *(Work in progress)*

```
GPIO15 → LED → GND
```

---

## Building

Each project is a standalone Zig package. Navigate into a project directory and run:

```sh
cd 1-blinky
zig build
```

The compiled `.uf2` firmware will be in `zig-out/firmware/`. To flash, hold the **BOOTSEL** button on the Pico while plugging in USB, then copy the `.uf2` file to the mounted drive.

## Requirements

- [Zig](https://ziglang.org/) `0.15.1`
- MicroZig `0.15.1` (fetched automatically via `zig build`)
