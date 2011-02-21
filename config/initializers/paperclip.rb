Paperclip.interpolates('name') do |attachment, style|
	attachment.instance.name.parameterize
end

Paperclip.interpolates('session_name') do |attachment, style|
	attachment.instance.session_name.parameterize
end