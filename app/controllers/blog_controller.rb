# this controller realistically should only handle the rendering the pre-written markdown
class BlogController < ApplicationController
  def show
    file_path = Rails.root.join('app', 'blog', "#{params[:file_path]}.md")

    if File.exist?(file_path)
      @html_content = markdown_to_html(File.read(file_path))
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
          # Start of code block
          @in_code_block = true
          @code_language = line.strip[3..-1].strip || 'plaintext'
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
    formatter = Rouge::Formatters::HTMLInline.new(Rouge::Themes::ThankfulEyes.new)
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
    line
      .gsub(/^# (.*?)$/, '<h1 class="size-lg">\1</h1>')
      .gsub(/^## (.*?)$/, '<h2>\1</h2>')
      .gsub(/^### (.*?)$/, '<h3>\1</h3>')
      .gsub(/^\* (.*?)$/, '<li>\1</li>')
      .gsub(/\*\*(.*?)\*\*/, '<strong>\1</strong>')
      .gsub(/\*(.*?)\*/, '<em>\1</em>')
      # .gsub(/`(.*?)`/, '<code>\1</code>')
      .gsub(/\n/, '<br>')
  end
end
