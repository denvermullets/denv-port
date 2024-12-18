# Code Markdown

this is _italic?_
This is a markdown file with codeblocks

## hi

### _hello_?

**BOLD**
**_bold italic?_**

```ruby
# frozen_string_literal: true

module Rouge
  module Themes
    class MulletTheme < CSSTheme
      name 'mullet_theme'


      # palette :background      => '#1b2932'   # Editor background
      # palette :foreground      => '#c5cdd3'   # Default text color
      # palette :cursor_fg       => '#b3d2e6'   # Cursor
      # palette :selection_bg    => '#5998c077' # Selection background
      # palette :comment_fg      => '#5e7887'   # Comments
      # palette :keyword_fg      => '#c88da2'   # Keywords
      # palette :variable_fg     => '#d3b692'   # Variables
      # palette :annotation_fg   => '#be856f'   # Types, annotations
      # palette :constant_fg     => '#a88c00'   # Constants
      # palette :tag_fg          => '#c37455'   # Tags and entities
      # palette :string_fg       => '#'   # Strings
      # palette :string_interp_fg => '#3f8d6c'  # Interpolated strings
      # palette :number_fg       => '#7068b1'   # Numbers
      # palette :function_fg     => '#3f848d'   # Function names
      # palette :support_fg      => '#72b7c0'   # Support classes, modules
      # palette :misc_fg         => '#5998c0'   # Miscellaneous
      # palette :invalid_fg      => '#b16a4e'   # Invalid/illegal text

      palette :black          => '#ffffdd'
      palette :bright_green   => '#72c09f'
      palette :bright_pink    => '#f92672'
      palette :carmine        => '#960050'
      palette :dark           => '#49483e'
      palette :dark_grey      => '#888888'
      palette :dark_red       => '#aa0000'
      palette :dimgrey        => '#75715e'
      palette :dimgreen       => '#324932'
      palette :dimred         => '#493131'
      palette :emperor        => '#555555'
      palette :grey           => '#999999'
      palette :light_grey     => '#aaaaaa'
      palette :light_violet   => '#ae81ff'
      palette :soft_cyan      => '#66d9ef'
      palette :soft_yellow    => '#e6db74'
      palette :very_dark      => '#1e0010'
      palette :whitish        => '#f8f8f2'
      palette :orange         => '#f6aa11'
      palette :white          => '#ffffff'

      style Comment,
            Comment::Multiline,
            Comment::Single,                  :fg => :dimgrey, :italic => true
      style Comment::Preproc,                 :fg => :dimgrey, :bold => true
      style Comment::Special,                 :fg => :dimgrey, :italic => true, :bold => true
      style Error,                            :fg => :carmine, :bg => :very_dark
      style Generic::Inserted,                :fg => :white, :bg => :dimgreen
      style Generic::Deleted,                 :fg => :white, :bg => :dimred
      style Generic::Emph,                    :italic => true
      style Generic::EmphStrong,              :italic => true, :bold => true
      style Generic::Error,
            Generic::Traceback,               :fg => :dark_red
      style Generic::Heading,                 :fg => :grey
      style Generic::Output,                  :fg => :dark_grey
      style Generic::Prompt,                  :fg => :emperor
      style Generic::Strong,                  :bold => true
      style Generic::Subheading,              :fg => :light_grey
      style Keyword,
            Keyword::Constant,
            Keyword::Declaration,
            Keyword::Pseudo,
            Keyword::Reserved,
            Keyword::Type,                    :fg => :soft_cyan, :bold => true
      style Keyword::Namespace,
            Operator::Word,
            Operator,                         :fg => :bright_pink, :bold => true
      style Literal::Number::Float,
            Literal::Number::Hex,
            Literal::Number::Integer::Long,
            Literal::Number::Integer,
            Literal::Number::Oct,
            Literal::Number,
            Literal::String::Escape,          :fg => :light_violet
      style Literal::String::Affix,           :fg => :soft_cyan, :bold => true
      style Literal::String::Backtick,
            Literal::String::Char,
            Literal::String::Doc,
            Literal::String::Double,
            Literal::String::Heredoc,
            Literal::String::Interpol,
            Literal::String::Other,
            Literal::String::Regex,
            Literal::String::Single,
            Literal::String::Symbol,
            Literal::String,                  :fg => :soft_yellow
      style Name::Attribute,                  :fg => :bright_green
      style Name::Class,
            Name::Decorator,
            Name::Exception,
            Name::Function,                   :fg => :bright_green, :bold => true
      style Name::Constant,                   :fg => :soft_cyan
      style Name::Builtin::Pseudo,
            Name::Builtin,
            Name::Entity,
            Name::Namespace,
            Name::Variable::Class,
            Name::Variable::Global,
            Name::Variable::Instance,
            Name::Variable,
            Text::Whitespace,                 :fg => :whitish
      style Name::Label,                      :fg => :whitish, :bold => true
      style Name::Tag,                        :fg => :bright_pink
      style Text,                             :fg => :whitish, :bg => :dark
    end
  end
end
```

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
.Bayer-04-redesign-concept-1-hex {
  color: #260202;
}
.Bayer-04-redesign-concept-2-hex {
  color: #f25757;
}
.Bayer-04-redesign-concept-3-hex {
  color: #bf6565;
}
.Bayer-04-redesign-concept-4-hex {
  color: #f2f2f2;
}
.Bayer-04-redesign-concept-5-hex {
  color: #0d0d0d;
}

/* Color Theme Swatches in RGBA */
.Bayer-04-redesign-concept-1-rgba {
  color: rgba(38, 1, 1, 1);
}
.Bayer-04-redesign-concept-2-rgba {
  color: rgba(242, 87, 87, 1);
}
.Bayer-04-redesign-concept-3-rgba {
  color: rgba(191, 101, 101, 1);
}
.Bayer-04-redesign-concept-4-rgba {
  color: rgba(242, 242, 242, 1);
}
.Bayer-04-redesign-concept-5-rgba {
  color: rgba(12, 12, 12, 1);
}

/* Color Theme Swatches in HSLA */
.Bayer-04-redesign-concept-1-hsla {
  color: hsla(0, 90, 7, 1);
}
.Bayer-04-redesign-concept-2-hsla {
  color: hsla(0, 85, 64, 1);
}
.Bayer-04-redesign-concept-3-hsla {
  color: hsla(0, 41, 57, 1);
}
.Bayer-04-redesign-concept-4-hsla {
  color: hsla(0, 0, 95, 1);
}
.Bayer-04-redesign-concept-5-hsla {
  color: hsla(0, 0, 5, 1);
}
```

```css
.universal-blue {
  color: #001528;
}
.universal-100 {
  color: #dfe3e8;
}
.universal-200 {
  color: #b1bcc6;
}
.universal-300 {
  color: #728495;
}
.universal-400 {
  color: #455e74;
}
.universal-500 {
  color: #284056;
}
.universal-600 {
  color: #10263a;
}
.solar-yellow {
  color: #ecff7c;
}
```
