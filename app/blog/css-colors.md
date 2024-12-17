# Code Markdown
This is a markdown file with codeblocks

```ruby
# controller
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
    content
      .gsub(/^# (.*?)$/, '<h1 class="size-lg">\1</h1>')
      .gsub(/^## (.*?)$/, '<h2>\1</h2>')
      .gsub(/^### (.*?)$/, '<h3>\1</h3>')
      .gsub(/^\* (.*?)$/, '<li>\1</li>')
      .gsub(/\*\*(.*?)\*\*/, '<strong>\1</strong>')
      .gsub(/\*(.*?)\*/, '<em>\1</em>')
      .gsub(/`(.*?)`/, '<code>\1</code>')
      .gsub(/\n/, '<br>')
  end
```

Color theme
```css
/* Color Theme Swatches in Hex */
.Bayer-04-redesign-concept-1-hex { color: #260202; }
.Bayer-04-redesign-concept-2-hex { color: #F25757; }
.Bayer-04-redesign-concept-3-hex { color: #BF6565; }
.Bayer-04-redesign-concept-4-hex { color: #F2F2F2; }
.Bayer-04-redesign-concept-5-hex { color: #0D0D0D; }

/* Color Theme Swatches in RGBA */
.Bayer-04-redesign-concept-1-rgba { color: rgba(38, 1, 1, 1); }
.Bayer-04-redesign-concept-2-rgba { color: rgba(242, 87, 87, 1); }
.Bayer-04-redesign-concept-3-rgba { color: rgba(191, 101, 101, 1); }
.Bayer-04-redesign-concept-4-rgba { color: rgba(242, 242, 242, 1); }
.Bayer-04-redesign-concept-5-rgba { color: rgba(12, 12, 12, 1); }

/* Color Theme Swatches in HSLA */
.Bayer-04-redesign-concept-1-hsla { color: hsla(0, 90, 7, 1); }
.Bayer-04-redesign-concept-2-hsla { color: hsla(0, 85, 64, 1); }
.Bayer-04-redesign-concept-3-hsla { color: hsla(0, 41, 57, 1); }
.Bayer-04-redesign-concept-4-hsla { color: hsla(0, 0, 95, 1); }
.Bayer-04-redesign-concept-5-hsla { color: hsla(0, 0, 5, 1); }

```


```css
.universal-blue { color: #001528 }
.universal-100 { color: #dfe3e8 }
.universal-200 { color: #b1bcc6 }
.universal-300 { color: #728495 }
.universal-400 { color: #455e74 }
.universal-500 { color: #284056 }
.universal-600 { color: #10263a }
.solar-yellow { color: #ecff7c }
```

