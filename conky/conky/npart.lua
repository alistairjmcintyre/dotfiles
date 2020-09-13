conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
    gap_x = 475,
    gap_y = 105,
    minimum_width = 125,
    maximum_width = 125,
    minimum_height = 125,

    -- Draw settings
    double_buffer = true,
    draw_shades = false,
    draw_blended = false,

    -- Compositor settings
    own_window = true,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_type = 'override'
};

conky.text = [[
${if_running spotify}${exec sh ./scripts/spotifyart}
${image ./data/spotify.jpg -p 0,0 -s 125x125 -n}
${endif}

${if_running cmus}
${exec sh ./scripts/cmusart}
${image ./data/cmus.jpg -p 0,0 -s 125x125 -n}
${endif}
]];
