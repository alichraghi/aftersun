const std = @import("std");
const zm = @import("zmath");
const flecs = @import("flecs");
const game = @import("root");
const gfx = game.gfx;
const components = game.components;

pub fn system() flecs.EcsSystemDesc {
    var desc = std.mem.zeroes(flecs.EcsSystemDesc);
    desc.callback = callback;
    return desc;
}

pub const FinalUniforms = extern struct {
    mvp: zm.Mat,
    output_channel: i32 = 0,
};

pub fn callback(it: *flecs.EcsIter) callconv(.C) void {
    if (it.count > 0) return;

    const uniforms = FinalUniforms{ .mvp = zm.transpose(game.state.camera.frameBufferMatrix()), .output_channel = @enumToInt(game.state.output_channel) };

    game.state.batcher.begin(.{
        .pipeline_handle = game.state.pipeline_final,
        .bind_group_handle = game.state.bind_group_final,
    }) catch unreachable;

    game.state.batcher.texture(zm.f32x4s(0), game.state.diffuse_output, .{}) catch unreachable;

    game.state.batcher.end(uniforms) catch unreachable;
}
