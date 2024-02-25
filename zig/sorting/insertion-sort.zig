const std = @import("std");

fn sort(arr: []i32) void {
    var i: usize = 0;
    while (i < arr.len) : (i += 1) {
        var j: usize = i;
        while (j > 0 and arr[j] < arr[j - 1]) : (j -= 1) {
            const t: i32 = arr[j - 1];
            arr[j - 1] = arr[j];
            arr[j] = t;
        }
    }
}

pub fn main() void {
    var a = [_]i32{ 12, 4, 23, 5, 14, 73, 1, 435, 76, 2, 24, 6, 143, 54, 7, 122, 234, 7564, 1222 };
    std.debug.print("{any}\n", .{a});
    sort(&a);
    std.debug.print("{any}\n", .{a});
}
