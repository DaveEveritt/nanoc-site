# Necessary because kramdown does not honor the `kbd` element as an element
# whose contents should remain preformatted.
#
# See https://github.com/gettalong/kramdown/issues/112
Class.new(Nanoc::Filter) do
  identifier :remove_smartness_from_kbd

  def run(content, params={})
    doc = Nokogiri::HTML.parse(content)
    doc.css('kbd').each { |e| e.inner_html = e.inner_html.sub('–', '--') }
    doc.to_s
  end
end
