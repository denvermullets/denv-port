# frozen_string_literal: true

module Rouge
  module Themes
    class MulletTheme < CSSTheme
      name 'mullet_theme'

      palette black:           '#1b2932'
      palette bright_green:    '#72c09f'
      palette bright_pink:     '#c88da2'
      palette carmine:         '#b16a4e'
      palette dark:            '#202e37'
      palette dark_grey:       '#5e7887'
      palette dark_red:        '#b96346'
      palette dimgrey:         '#5d6e79'
      palette dimgreen:        '#3f8d6c'
      palette dimred:          '#c37455'
      palette emperor:         '#496d83'
      palette grey:            '#96a8b6'
      palette light_grey:      '#98a6ae'
      palette light_violet:    '#7068b1'
      palette soft_cyan:       '#72b7c0'
      palette soft_yellow:     '#d3b692'
      palette very_dark:       '#0e1920'
      palette whitish:         '#c5cdd3'
      palette orange:          '#c09159'
      palette white:           '#ffffff'

      style Comment,
            Comment::Multiline,
            Comment::Single,                  fg: :dimgrey, italic: true
      style Comment::Preproc,                 fg: :dimgrey, bold: true
      style Comment::Special,                 fg: :dimgrey, italic: true, bold: true
      style Error,                            fg: :carmine, bg: :very_dark
      style Generic::Inserted,                fg: :white, bg: :dimgreen
      style Generic::Deleted,                 fg: :white, bg: :dimred
      style Generic::Emph,                    italic: true
      style Generic::EmphStrong,              italic: true, bold: true
      style Generic::Error,
            Generic::Traceback,               fg: :dark_red
      style Generic::Heading,                 fg: :grey
      style Generic::Output,                  fg: :dark_grey
      style Generic::Prompt,                  fg: :emperor
      style Generic::Strong,                  bold: true
      style Generic::Subheading,              fg: :light_grey
      style Keyword,
            Keyword::Constant,
            Keyword::Declaration,
            Keyword::Pseudo,
            Keyword::Reserved,
            Keyword::Type, fg: :soft_cyan, bold: true
      style Keyword::Namespace,
            Operator::Word,
            Operator, fg: :bright_pink, bold: true
      style Literal::Number::Float,
            Literal::Number::Hex,
            Literal::Number::Integer::Long,
            Literal::Number::Integer,
            Literal::Number::Oct,
            Literal::Number,
            Literal::String::Escape,          fg: :light_violet
      style Literal::String::Affix,           fg: :soft_cyan, bold: true
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
            Literal::String,                  fg: :soft_yellow
      style Name::Attribute,                  fg: :bright_green
      style Name::Class,
            Name::Decorator,
            Name::Exception,
            Name::Function,                   fg: :bright_green, bold: true
      style Name::Constant,                   fg: :soft_cyan
      style Name::Builtin::Pseudo,
            Name::Builtin,
            Name::Entity,
            Name::Namespace,
            Name::Variable::Class,
            Name::Variable::Global,
            Name::Variable::Instance,
            Name::Variable,
            Text::Whitespace,                 fg: :whitish
      style Name::Label,                      fg: :whitish, bold: true
      style Name::Tag,                        fg: :bright_pink
      style Text,                             fg: :whitish, bg: :dark
    end
  end
end
