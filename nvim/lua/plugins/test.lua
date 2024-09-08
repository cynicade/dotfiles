return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest", "adrigzr/neotest-mocha" },
    opts = function(_, opts)
      table.insert(opts.adapters, require("neotest-jest"))
      table.insert(opts.adapters, require("neotest-vitest"))
      table.insert(opts.adapters, require("neotest-mocha"))
    end,
  },
}
