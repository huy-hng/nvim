return {
	settings = {
		xml = {
			format = {
				enable = true,
				splitAttributes = false, -- (f) each attribute is formatted onto new line
				joinCDATALines = false, -- (f) normalize content inside CDATA
				joinCommentLines = false, -- (f) normalize content inside comments
				formatComments = true, -- (t) keep comment in relative position
				joinContentLines = true, -- (f) normalize content inside elements
				spaceBeforeEmptyCloseTag = true, -- (t) insert whitespace before self closing tag end bracket
			},
		},
	},
}
