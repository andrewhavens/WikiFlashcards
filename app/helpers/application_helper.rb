module ApplicationHelper
	def history_diff(card_changeset)
		result = card_changeset.map do |k,v|
			content_tag(:span, v[0], :class => "old_value") + ' to ' + content_tag(:span, v[1], :class => "new_value")
		end
		result.to_sentence.html_safe
	end
end
