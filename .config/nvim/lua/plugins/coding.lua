return {
  -- Properly configure blink.cmp to disable automatic completion popup
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          auto_show = false,
        },
      },
    },
  },
}
