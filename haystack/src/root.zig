const std = @import("std");
const sqlite = @import("sqlite");

const testing = std.testing;

pub export fn add(a: i32, b: i32) i32 {
    {
        // in-memory database
        const db = sqlite.Database.open(.{});
        if (db) |item| {
            std.debug.print("{any}\n", .{item});
            defer item.close();
        } else |err| {
            std.debug.print("{any}\n", .{err});
        }
    }

    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}
