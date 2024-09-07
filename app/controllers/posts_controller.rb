class PostsController < ApplicationController
  def show
    # The slug will be passed in the URL
    @slug = params[:id]
    @content = Post.load_markdown_content(@slug, I18n.locale)

    if @content.present?
      @rendered_content = Post.render_markdown_content(@content)
    else
      flash[:alert] = "Sorry, the post you're looking for isn't available in #{I18n.locale == :ar ? "Arabic" : "English"}."
      redirect_to(root_path)
    end
  end

  def index
    # Assuming post slugs are stored in a database or you read from directories
    @slugs = Dir.glob(Rails.root.join("db", "posts", "*")).map { |path| File.basename(path) }
  end
end
