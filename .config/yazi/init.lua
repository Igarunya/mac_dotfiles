require("recycle-bin"):setup()
require("fs-usage"):setup({
    position = { parent = "Header", align = "RIGHT", order = 2000 },
    format = "both",
    bar = true,
    warning_threshold = 85,

    -- Текст: Чисто белый и жирный для максимального контраста
    style_label = { fg = "#ffffff", bold = true },

    -- Обычное состояние: Тёмно-оливковый (приглушенный)
    -- bg = "#101014" — делаем фон полоски очень темным
    style_normal = { fg = "#41a6b5", bg = "#101014" },

    -- Предупреждение: Тускло-оранжевый (вместо ядовитого)
    style_warning = { fg = "#bb9af7", bg = "#101014" },

    padding = { open = "", close = "" }
})

require("projects"):setup({
    event = {
        save = {
            enable = true,
            name = "project-saved",
        },
        load = {
            enable = true,
            name = "project-loaded",
        },
        delete = {
            enable = true,
            name = "project-deleted",
        },
        delete_all = {
            enable = true,
            name = "project-deleted-all",
        },
        merge = {
            enable = true,
            name = "project-merged",
        },
    },
    save = {
        method = "yazi", -- yazi | lua
        yazi_load_event = "@projects-load", -- event name when loading projects in `yazi` method
        lua_save_path = "", -- path of saved file in `lua` method, comment out or assign explicitly
                            -- default value:
                            -- windows: "%APPDATA%/yazi/state/projects.json"
                            -- unix: "~/.local/state/yazi/projects.json"
    },
    last = {
        update_after_save = true,
        update_after_load = true,
        update_before_quit = false,
        load_after_start = false,
    },
    merge = {
        event = "projects-merge",
        quit_after_merge = false,
    },
    notify = {
        enable = true,
        title = "Projects",
        timeout = 3,
        level = "info",
    },
})
