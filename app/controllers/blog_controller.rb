# this controller realistically should only handle the rendering the pre-written markdown
class BlogController < ApplicationController
  BLOG_PATH = Rails.root.join('app', 'blog').freeze

  def show
    requested_file = "#{params[:file_path]}.md".to_s

    # we want to restrict access to just files that exist
    allowed_files = Dir.glob(BLOG_PATH.join('**/*.md'))
                       .map { |f| Pathname.new(f).relative_path_from(BLOG_PATH).to_s }

    if allowed_files.include?(requested_file)
      full_path = BLOG_PATH.join(requested_file)
      markdown = File.read(full_path)
      @html_content = Convert::MdToHtml.call(markdown)
    else
      render plain: '404 Not Found', status: :not_found
    end
  end
end
