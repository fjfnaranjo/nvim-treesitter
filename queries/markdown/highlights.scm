;; From MDeiml/tree-sitter-markdown
(atx_heading (heading_content) @text.title)
(setext_heading (heading_content) @text.title)

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @punctuation.special

[
  (code_span)
  (link_title)
  (indented_code_block)
  (fenced_code_block)
] @text.literal

[
  (emphasis_delimiter)
  (code_span_delimiter)
  (fenced_code_block_delimiter)
] @punctuation.delimiter

(code_fence_content) @none

(emphasis) @text.emphasis

(strong_emphasis) @text.strong

[
  (link_destination)
  (uri_autolink)
] @text.uri

[
  (link_label)
  (link_text)
  (image_description)
] @text.reference

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
  (thematic_break)
] @punctuation.special

(block_quote_marker) @punctuation.special

[
  (backslash_escape)
  (hard_line_break)
] @string.escape

(image "!" @punctuation.delimiter)
(image "[" @punctuation.delimiter)
(image "]" @punctuation.delimiter)
(image "(" @punctuation.delimiter)
; (image ")" @punctuation.delimiter)

(inline_link "[" @punctuation.delimiter)
(inline_link "]" @punctuation.delimiter)
(inline_link "(" @punctuation.delimiter)
; (inline_link ")" @punctuation.delimiter)

(shortcut_link "[" @punctuation.delimiter)
(shortcut_link "]" @punctuation.delimiter)

([
  (info_string)
  (fenced_code_block_delimiter)
  (code_span_delimiter)
  (emphasis_delimiter)
] @conceal
(#set! conceal ""))


; Conceal inline links
(inline_link
  [
    "["
    "]"
    "("
   (link_destination)
    ")"
] @conceal
(#set! conceal ""))


; Conceal image links
(image
  [
    "!"
    "["
    "]"
    "("
   (link_destination)
    ")"
] @conceal
  (#set! conceal ""))
