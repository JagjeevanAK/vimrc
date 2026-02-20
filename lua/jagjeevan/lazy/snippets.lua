
 return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local fmt = require("luasnip.extras.fmt").fmt

            -- Load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            ls.filetype_extend("javascript", { "jsdoc" })
            ls.filetype_extend("javascriptreact", { "javascript", "jsdoc" })
            ls.filetype_extend("typescript", { "javascript", "jsdoc" })
            ls.filetype_extend("typescriptreact", { "typescript", "javascript", "jsdoc" })

            -- React snippets
            ls.add_snippets("javascriptreact", {
                s("rfc", fmt([[
import React from 'react';

const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], { i(1, "ComponentName"), i(2, "Content"), f(function(args) return args[1][1] end, {1}) })),

                s("rfce", fmt([[
import React from 'react';

export const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};
]], { i(1, "ComponentName"), i(2, "Content") })),

                s("useState", fmt([[
const [{}, set{}] = useState({});
]], { i(1, "state"), f(function(args) 
                    local name = args[1][1]
                    return name:sub(1,1):upper() .. name:sub(2)
                end, {1}), i(2, "initialValue") })),

                s("useEffect", fmt([[
useEffect(() => {{
  {}
}}, [{}]);
]], { i(1, "// effect"), i(2, "dependencies") })),

                s("useContext", fmt([[
const {} = useContext({});
]], { i(1, "value"), i(2, "Context") })),

                s("useMemo", fmt([[
const {} = useMemo(() => {{
  return {};
}}, [{}]);
]], { i(1, "memoizedValue"), i(2, "computation"), i(3, "dependencies") })),

                s("useCallback", fmt([[
const {} = useCallback(({}) => {{
  {}
}}, [{}]);
]], { i(1, "memoizedCallback"), i(2, "params"), i(3, "// callback body"), i(4, "dependencies") })),

                s("useReducer", fmt([[
const [{}, dispatch] = useReducer({}, {});
]], { i(1, "state"), i(2, "reducer"), i(3, "initialState") })),

                s("customHook", fmt([[
import {{ {} }} from 'react';

export const {} = ({}) => {{
  {}

  return {{{}}};
}};
]], { i(1, "useState"), i(2, "useCustomHook"), i(3, "params"), i(4, "// hook logic"), i(5, "return values") })),
            })

            -- TypeScript React snippets
            ls.add_snippets("typescriptreact", {
                s("rfc", fmt([[
import React from 'react';

interface {}Props {{
  {}
}}

const {}: React.FC<{}Props> = ({{ {} }}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], { i(1, "Component"), i(2, "// props"), f(function(args) return args[1][1] end, {1}), 
      f(function(args) return args[1][1] end, {1}), i(3, "props"), i(4, "Content"), 
      f(function(args) return args[1][1] end, {1}) })),

                s("interface", fmt([[
interface {} {{
  {}
}}
]], { i(1, "InterfaceName"), i(2, "// properties") })),

                s("type", fmt([[
type {} = {{
  {}
}};
]], { i(1, "TypeName"), i(2, "// properties") })),

                s("useState", fmt([[
const [{}, set{}] = useState<{}>({});
]], { i(1, "state"), f(function(args) 
                    local name = args[1][1]
                    return name:sub(1,1):upper() .. name:sub(2)
                end, {1}), i(2, "Type"), i(3, "initialValue") })),
            })

            -- Snippet navigation keymaps
            --- TODO: What is expand?
            vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true}) -- Expand current snippet

            vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true}) -- Jump to next snippet placeholder
            vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true}) -- Jump to previous snippet placeholder

            vim.keymap.set({"i", "s"}, "<C-l>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true}) -- Change choice in snippet choice nodes
        end,
    }
}

