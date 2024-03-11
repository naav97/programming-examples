const std = @import("std");

fn merge(arr: []i32, i: usize, j: usize, m: usize, arena: *std.heap.ArenaAllocator) !void {
    var l: usize = i;
    var r: usize = m + 1;
    var tempArr = try arena.allocator().alloc(i32, (j - i) + 1);
    defer arena.allocator().free(tempArr);
    var count: usize = 0;

    while (l <= m and r <= j) : (count = count + 1) {
        if (arr[l] <= arr[r]) {
            tempArr[count] = arr[l];
            l = l + 1;
        } else {
            tempArr[count] = arr[r];
            r = r + 1;
        }
    }

    while (l <= m) : (count = count + 1) {
        tempArr[count] = arr[l];
        l = l + 1;
    }

    while (r <= j) : (count = count + 1) {
        tempArr[count] = arr[r];
        r = r + 1;
    }

    var k: usize = i;
    while (k <= j) : (k = k + 1) {
        arr[k] = tempArr[k - i];
    }
}

fn sort(arr: []i32, i: usize, j: usize, arena: *std.heap.ArenaAllocator) !void {
    if (j > i) {
        const mitad: usize = @divTrunc(j - i, 2) + i;
        try sort(arr, i, mitad, arena);
        try sort(arr, mitad + 1, j, arena);
        try merge(arr, i, j, mitad, arena);
    }
}

pub fn main() !void {
    var a = [_]i32{ 43, 76, 22, 543, 6, 2, 33, 3, 7, 4, 5, 8, 9, 0, 54, 66, 23, 77, 78, 34, 87, 23, 42, 224, 76575, 45, 777, 556, 64 };
    std.debug.print("{any}\n", .{a});
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    try sort(&a, 0, a.len - 1, &arena);
    std.debug.print("{any}\n", .{a});
}
