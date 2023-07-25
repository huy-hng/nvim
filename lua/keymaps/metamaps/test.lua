local bufmap = Map.meta('Buf test', { buffer = true })

bufmap:map_enter('n', '<localleader>e')
bufmap:map_exit('n', { 'q', '<esc>' })

bufmap:n('w', 'j')

-- local map = Map.meta('No buf test')

-- map:map_enter('n', '<leader>o')
-- map:map_exit('n', '<Esc>')

-- -- map:n('f', 'k')

-- map:n('a', 'o')
-- map:n('r', 'h')
-- map:n('s', 'j')
-- map:n('t', 'k')
-- map:n('g', 'l')
