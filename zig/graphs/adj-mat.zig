const std = @import("std");

fn add_edge(nodes: *[5][5]usize, ini: usize, fin: usize, peso: usize) void {
    nodes[ini][fin] = peso;
}

fn printGraph(nodes: *[5][5]usize) void {
    for (nodes, 0..) |row, i| {
        std.debug.print("({})", .{i});
        for (row, 0..) |cell, j| {
            if (cell > 0) {
                std.debug.print(" -{}> {}", .{ cell, j });
            }
        }
        std.debug.print("\n", .{});
    }
}

fn new_list(list: *[5]isize) void {
    for (0..5) |i| {
        list[i] = -1;
    }
}

fn add_back(list: *[5]isize, n: isize) void {
    for (0..5) |i| {
        if (list[i] == -1) {
            list[i] = n;
            break;
        }
    }
}

fn pop_front(list: *[5]isize) isize {
    const re: isize = list[0];
    for (0..4) |i| {
        list[i] = list[i + 1];
    }
    return re;
}

fn list_size(list: *[5]isize) usize {
    var re: usize = 0;
    for (list) |li| {
        if (li == -1) {
            break;
        }
        re = re + 1;
    }
    return re;
}

fn BellmanFord(nodes: *[5][5]usize, pn: usize, dist: *[5]usize) void {
    var fila: [5]isize = undefined;
    new_list(&fila);
    var procesado: [5]bool = undefined;
    var i: usize = 0;
    while (i < 5) : (i += 1) {
        dist[i] = 100;
        procesado[i] = false;
    }

    add_back(&fila, @intCast(pn));
    dist[pn] = 0;

    while (list_size(&fila) > 0) {
        const act: usize = @intCast(pop_front(&fila));
        var j: usize = 0;
        while (j < 5) : (j += 1) {
            if (nodes[act][j] > 0) {
                if (dist[act] + nodes[act][j] < dist[j]) {
                    dist[j] = dist[act] + nodes[act][j];
                }
                if (!procesado[j]) {
                    add_back(&fila, @intCast(j));
                }
            }
        }
        procesado[act] = true;
    }
}

pub fn main() void {
    var nodes: [5][5]usize = undefined;
    for (&nodes) |*row| {
        for (row) |*cell| {
            cell.* = 0;
        }
    }
    add_edge(&nodes, 0, 1, 1);
    add_edge(&nodes, 0, 2, 15);
    add_edge(&nodes, 1, 3, 6);
    add_edge(&nodes, 1, 4, 2);
    add_edge(&nodes, 3, 1, 1);
    add_edge(&nodes, 3, 2, 5);
    add_edge(&nodes, 4, 3, 3);

    printGraph(&nodes);
    var dist: [5]usize = undefined;
    BellmanFord(&nodes, 0, &dist);
    for (dist, 0..) |di, d| {
        std.debug.print("De 0 a {}: {}\n", .{ d, di });
    }
}
