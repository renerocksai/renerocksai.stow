local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local c = ls.choice_node
local i = ls.insert_node
local conds = require("luasnip.extras.expand_conditions")

ls.snippets = {
	all = {},
	text = {
		s("lg", {
			i(1),
			t({
				"",
				"LG,",
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
				"",
				"Rene Schallner",
				"Technology Lab Manager",
				"",
				"Senior Researcher",
				-- "AI Research // Machine Learning & Robotics",
				-- "Human Centered AI // Machine Learning & Robotics",
				"Human Centered AI",
				"Machine Learning & Robotics",
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
