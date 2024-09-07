class Post < ApplicationRecord
  def self.load_markdown_content(slug, locale)
    filename = locale == :ar ? "ar.md" : "en.md"
    filepath = Rails.root.join("db", "posts", slug, filename)
    File.exist?(filepath) ? File.read(filepath) : nil
  end

  def self.render_markdown_content(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(content).html_safe
  end
end
