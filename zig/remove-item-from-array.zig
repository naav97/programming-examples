const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3 };

    std.debug.print("[", .{});
    for (nums) |num| {
        std.debug.print("{}", .{num});
    }
    std.debug.print("]\n", .{});

    var newArr: [nums.len - 1]i32 = undefined;
    var j: usize = 0;
    for (nums) |num| {
        if (num != 2) {
            newArr[j] = num;
            j += 1;
        }
    }

    std.debug.print("[", .{});
    for (newArr) |num| {
        std.debug.print("{}", .{num});
    }
    std.debug.print("]\n", .{});
}
