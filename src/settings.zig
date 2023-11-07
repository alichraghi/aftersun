const std = @import("std");
const zmath = @import("zmath");

/// The design texture width for render-textures.
pub const design_width: u32 = 1280;

/// The design texture height for render-textures.
pub const design_height: u32 = 720;

/// The design texture size for render-textures as an f32x4.
pub const design_size = zmath.f32x4(@floatFromInt(design_width), @floatFromInt(design_height), 0, 0);

/// The number of zoom steps to have above minimum, camera.maxZoom() returns camera.minZoom + this value.
pub const max_zoom_offset: f32 = 2.0;

/// How quickly the camera will zoom to the next step.
pub const zoom_speed: f32 = 2.0;

/// The scroll offset required to trigger a zoom step.
pub const zoom_scroll_tolerance: f32 = 0.2;

/// The number of pixels per tile in width and height.
pub const pixels_per_unit: f32 = 32.0;

/// The seconds it takes for a move to be completed from one tile to another.
// TODO: Embed this in character stats.
pub const movement_cooldown: f32 = 0.38;

/// The number of sprites expected per batch to the batcher.
pub const batcher_max_sprites = 20000;

/// The font size used by zgui elements.
pub const zgui_font_size = 15;

/// Size of a square game cell in tiles wide/tall.
pub const cell_size = 15;

/// Maximum number of tiles visible either in width or height
pub const max_visible_tiles: f32 = @floatFromInt(cell_size * 2);

/// Speed at which the camera will lerp to new velocity.
pub const camera_follow_speed = 1.0;
