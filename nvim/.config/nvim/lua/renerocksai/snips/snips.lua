local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local c = ls.choice_node
local i = ls.insert_node
local conds = require("luasnip.extras.expand_conditions")

M = {}

function M.init_snippets()
	ls.add_snippets("all", {
		-- shit to test if snips completion is working
		s("xxx", {
			i(1),
			t({
				"this is xxx",
			}, {
				-- condition = conds.line_begin,
			}),
		}),
	})

	ls.add_snippets("text", {
		s("lg", {
			i(1),
			t({
				"",
				"LG",
				"Rene",
				"",
				"______________________________________________________________________________",
			}, {
				condition = conds.line_begin,
			}),
		}),
		s("sig", {
			i(1),
			t({
				"",
				"",
				"///",
				-- "",
				"Rene Schallner",
				"Technology Lab Manager - Senior Researcher",
				"Human Centered AI - Machine Learning",
				"",
				"T +49 911 9515 1977",
				"rene.schallner@nim.org",
				"",
				"Nürnberg Institut für Marktentscheidungen (zuvor GfK Verein)",
				"Gründer und Ankeraktionär der GfK SE",
				"Vereinsregister Amtsgericht Nürnberg VR200665",
			}),
		}),
	})
	ls.filetype_extend("mail", { "text" })

	-- print(vim.inspect(ls.snippets))
end

M.init_snippets()
return M
