return {
  "saghen/blink.cmp",
  -- event = { "InsertEnter", "CmdLineEnter" },
  opts = {
    -- appearance = {
    --   -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
    --   nerd_font_variant = "mono",
    -- },

    -- list = { selection = { preselect = false, auto_insert = false } },
    -- See :h blink-cmp-config-keymap
    keymap = {
      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      -- ["º"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
    },

    -- (Default) Only show the documentation popup when manually triggered
    -- completion = { documentation = { auto_show = true } },

    -- sources = {
    --   default = { "lsp", "path", "buffer" },
    -- },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    -- fuzzy = { implementation = "lua" },
  },
  -- opts_extend = { "sources.default" },
}
