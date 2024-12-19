# this controller realistically should only handle the rendering the pre-written markdown
class BlogController < ApplicationController
  BLOG_PATH = Rails.root.join('app', 'blog').freeze

  def show
    requested_file = "#{params[:file_path]}.md".to_s

    # Get list of actual markdown files in blog directory
    allowed_files = Dir.glob(BLOG_PATH.join('**/*.md'))
                       .map { |f| Pathname.new(f).relative_path_from(BLOG_PATH).to_s }

    if allowed_files.include?(requested_file)
      full_path = BLOG_PATH.join(requested_file)
      markdown = File.read(full_path)
      @html_content = markdown_to_html(markdown)
    else
      render plain: '404 Not Found', status: :not_found
    end
  end

  private

  def markdown_to_html(content)
    @in_code_block = false
    @code_language = 'plaintext'
    @code_buffer = ''
    @formatted_content = []

    # we can't gsub our way out of this, so line by line it is
    content.each_line do |line|
      # figure out if it's the start/end of code block
      if line.strip.start_with?('```')
        if @in_code_block
          end_of_block
        else
          # start of code block
          @in_code_block = true
          # strip the first 3 backticks
          @code_language = line.strip[3..].strip || 'plaintext'
        end
      elsif @in_code_block
        # still in the block so add the line
        @code_buffer += line
      else
        # non codeblock regex
        line = format_line(line)
        @formatted_content << line
      end
    end

    # final HTML content
    @formatted_content.join
  end

  def end_of_block
    # formatter = Rouge::Formatters::HTMLInline.new('gruvbox')
    # formatter = Rouge::Formatters::HTMLInline.new(Rouge::Themes::Base16.mode(:dark).new)
    # formatter = Rouge::Formatters::HTMLInline.new(Rouge::Themes::ThankfulEyes.new)
    formatter = Rouge::Formatters::HTMLInline.new(Rouge::Themes::MulletTheme.new)

    lexer = Rouge::Lexer.find(@code_language) || Rouge::Lexers::PlainText
    highlighted_code = formatter.format(lexer.lex(@code_buffer))

    @formatted_content << <<~HTML
      <div class="code-block">
        <pre><code class="language-#{@code_language}">#{highlighted_code}</code></pre>
      </div>
    HTML

    @in_code_block = false
    @code_buffer = ''
    @code_language = 'plaintext'
  end

  def format_line(line)
    line = line.strip
    return if line.empty?

    line = process_line_headers(line)
    line = process_inline_elements(line)
    "#{line} <br>"
  end

  # rubocop:disable Metrics/AbcSize
  def process_line_headers(line)
    # store in hash map of lambdas
    transformations = {
      /^#### (.*)$/ => ->(match) { "<h4 class='text-vazBlue-700'>#{process_inline_elements(match[1])}</h3>" },
      /^### (.*)$/ => ->(match) { "<h3 class='text-vazBlue-700'>#{process_inline_elements(match[1])}</h3>" },
      /^## (.*)$/ => ->(match) { "<h2 class='text-vazBlue-700'>#{process_inline_elements(match[1])}</h2>" },
      /^# (.*)$/ => ->(match) { "<h1 class='text-vazBlue-700'>#{process_inline_elements(match[1])}</h1>" },
      /^\* (.*)$/ => ->(match) { "<li>#{process_inline_elements(match[1])}</li>" },
      /^- (.*)$/ => ->(match) { "<li>#{process_inline_elements(match[1])}</li>" }
    }

    transformations.each do |regex, transform|
      return transform.call(line.match(regex)) if line.match?(regex)
    end

    line
  end
  # rubocop:enable Metrics/AbcSize

  def process_inline_elements(text)
    text
      .gsub(/!\[(.*?)\]\((.*?)\)/, '<img src="\2" alt="\1">')
      .gsub(/__([^_]+?)__/, '<strong>\1</strong>')
      .gsub(/\*\*([^*]+?)\*\*/, '<strong>\1</strong>')
      .gsub(/_([^_]+?)_/, '<em>\1</em>')
      .gsub(/\*([^*]+?)\*/, '<em>\1</em>')
      .gsub(/`([^`]+?)`/, '<code>\1</code>')
      .gsub(/\[(.*?)\]\((.*?)\)/, '<a href="\2">\1</a>')
  end
end
