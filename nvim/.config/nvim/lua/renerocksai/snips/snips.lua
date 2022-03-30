local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local c = ls.choice_node
local i = ls.insert_node
local conds = require("luasnip.extras.expand_conditions")

ls.snippets = {
	all = {
		-- shit to test if snips completion is working
		s("xxx", {
			i(1),
			t({
				"this is xxx",
			}, {
				-- condition = conds.line_begin,
			}),
		}),
	},
	text = {
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
				"Nürnberg Institut für Marktentscheidungen (zuvor GfK Verein)",
				"Gründer und Ankeraktionär der GfK SE",
				"",
				"T +49 911 9515 1977",
				"rene.schallner@nim.org",
				"",
				"Vereinsregister Amtsgericht Nürnberg VR200665",
			}),
		}),
	},
}
ls.snippets.mail = ls.snippets.text

-- print(vim.inspect(ls.snippets))
