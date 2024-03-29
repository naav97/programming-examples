const std = @import("std");

const Node = struct {
    id: usize,
    next: ?*Node,
};

fn add_edge(nodes: []?*Node, n1: *Node, n2: *Node, ini: usize, fin: usize) void {
    n1.id = ini;
    n1.next = nodes[fin];
    nodes[fin] = n1;
    n2.id = fin;
    n2.next = nodes[ini];
    nodes[ini] = n2;
}

fn printGraph(nodes: []?*Node) void {
    var i: usize = 0;
    while (i < nodes.len) : (i = i + 1) {
        std.debug.print("({any}) ", .{i});
        var temp: *Node = nodes[i] orelse {
            break;
        };
        while (true) {
            std.debug.print("-> {any}", .{temp.id});
            if (temp.next) |next| {
                temp = next;
            } else {
                break;
            }
        }
        std.debug.print("\n", .{});
    }
}

fn procesar(nodes: []?*Node, vis: []bool, pid: usize) void {
    vis[pid] = true;
    std.debug.print("{any} -> ", .{pid});
    var temp: *Node = nodes[pid] orelse {
        return;
    };
    while (true) {
        if (!vis[temp.id]) {
            procesar(nodes, vis, temp.id);
        }
        temp = temp.next orelse {
            break;
        };
    }
}

fn dfs(nodes: []?*Node) void {
    var visitado = [_]bool{false} ** 5;
    procesar(nodes, &visitado, 0);
    std.debug.print("\n", .{});
}

fn add_back(list: []isize, n: usize) void {
    for (list, 0..) |item, i| {
        if (item == -1) {
            list[i] = @intCast(n);
            break;
        }
    }
}

fn list_size(list: []isize) usize {
    var re: usize = 0;
    for (list) |item| {
        if (item == -1) {
            break;
        }
        re = re + 1;
    }
    return re;
}

fn pop_front(list: []isize) usize {
    const re: usize = @intCast(list[0]);
    var i: usize = 0;
    while (i < list.len - 1) : (i = i + 1) {
        list[i] = list[i + 1];
    }
    return re;
}

fn bfs(nodes: []?*Node) void {
    var visitado = [_]bool{false} ** 5;
    var line = [_]isize{-1} ** 5;
    add_back(&line, 0);
    visitado[0] = true;

    while (list_size(&line) > 0) {
        const act: usize = pop_front(&line);
        std.debug.print("{any} -> ", .{act});

        var temp: *Node = nodes[act] orelse {
            break;
        };
        while (true) {
            if (!visitado[temp.id]) {
                add_back(&line, temp.id);
                visitado[temp.id] = true;
            }
            temp = temp.next orelse {
                break;
            };
        }
    }
    std.debug.print("\n", .{});
}

pub fn main() void {
    var n01 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n10 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n04 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n40 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n12 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n21 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n13 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n31 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n14 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n41 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n23 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n32 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n34 = Node{
        .id = undefined,
        .next = undefined,
    };
    var n43 = Node{
        .id = undefined,
        .next = undefined,
    };
    var nodes: [5]?*Node = .{ null, null, null, null, null };
    add_edge(&nodes, &n01, &n10, 0, 1);
    add_edge(&nodes, &n04, &n40, 0, 4);
    add_edge(&nodes, &n12, &n21, 1, 2);
    add_edge(&nodes, &n13, &n31, 1, 3);
    add_edge(&nodes, &n14, &n41, 1, 4);
    add_edge(&nodes, &n23, &n32, 2, 3);
    add_edge(&nodes, &n34, &n43, 3, 4);

    printGraph(&nodes);
    dfs(&nodes);
    bfs(&nodes);
}
