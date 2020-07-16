conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
    gap_x = 0,
    gap_y = 70,
    minimum_width = 3440,
    maximum_width = 3440,
    minimum_height = 200,

    -- Draw settings
    double_buffer = true,
    draw_shades = false,
    draw_blended = false,

    background = true,

    -- Compositor settings
    own_window = true,
    own_window_argb_visual = true,
    own_window_argb_value = 150,
	own_window_colour = '1d1d1d',

    own_window_transparent = false,
    own_window_hints = 'bottom,undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_type = 'override',

    -- Text settings
    uppercase = true,
    use_xft = true,
    override_utf8_locale = true
};

conky.text = [[
]];
