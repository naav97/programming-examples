const print = @import("std").debug.print;
const std = @import("std");

pub fn main() void {
    const string = "Fvnjailhgdi";
    print("{s}\n", .{string});
    const subString = "jail";
    print("{s}\n", .{subString});

    const exist = std.mem.indexOf(u8, string, subString);

    if (exist != null) {
        print("{}\n", .{true});
    } else {
        print("{}\n", .{false});
    }
}
