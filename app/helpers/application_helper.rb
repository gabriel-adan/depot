module ApplicationHelper
	def hidden_div_if(condition, attribures = {}, &block)
		if condition
			attribures["style"] = "display: none"
		end
		content_tag("div", attribures, &block)
	end
end
