---@alias saved_buffer_keymap
---| { buffer: number, callback: function, rhs: string|nil, desc: string, expr: number, lhs: string, lhsraw: string, lnum: number, mode: string, noremap: number, nowait: number, script: number, sid: number, silent: number, }

---@alias mode modes | modes[]
---@alias lhs string | table
---@alias rhs string | function | table
---@alias desc string?
---@alias opts table?

---@alias modes
---| 'n' normal
---| 'v' visual + select
---| 'i' insert
---| 'x' visual
---| 's' select
---| 'o' operator
---| 'c' command
---| 'l' language
---| 't' terminal
