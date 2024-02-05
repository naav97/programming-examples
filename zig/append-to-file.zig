const std = @import("std");

pub fn main() !void {
    const file = try std.fs.cwd().createFile("file.txt", .{ .truncate = false });
    const stats = try file.stat();
    try file.seekTo(stats.size);
    _ = try file.write("Hi!\n");
    file.close();

    const file2 = try std.fs.cwd().openFile("file.txt", .{});
    defer file2.close();

    var buff: [1]u8 = undefined;
    while (true) {
        const bytesRead = try file2.read(&buff);
        if (bytesRead == 0) break;

        std.debug.print("{s}", .{buff});
    }
}
