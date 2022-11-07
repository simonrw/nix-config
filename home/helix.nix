{ pkgs }:
{
  enable = true;
  settings = {
    theme = "ayu_dark";
    editor = {
      line-number = "relative";
      auto-pairs = false;
      true-color = true;
    };
    keys.normal = {
      # Quick iteration on config changes
      "C-o" = ":config-open";
      "C-r" = ":config-reload";

      # Some nice Helix stuff
      "C-h" = "select_prev_sibling";
      "C-j" = "shrink_selection";
      "C-k" = "expand_selection";
      "C-l" = "select_next_sibling";
      # Personal preference
      "o" = ["open_below" "normal_mode"];
      "O" = ["open_above" "normal_mode"];

      # Muscle memory
      "{" = ["goto_prev_paragraph" "collapse_selection"];
      "}" = ["goto_next_paragraph" "collapse_selection"];
      "0" = "goto_line_start";
      "$" = "goto_line_end";
      "^" = "goto_first_nonwhitespace";
      "G" = "goto_file_end";
      "%" = "match_brackets";
      "V" = ["select_mode" "extend_to_line_bounds"];
      "C" = ["collapse_selection" "extend_to_line_end" "change_selection"];
      "D" = ["extend_to_line_end" "delete_selection"];
      "S" = "surround_add"; # Would be nice to be able to do something after this but it isn't chainable
    };
  };
  languages = [
    {
      name = "python";
      language-server = {
        command = "${pkgs.pyright}/bin/pyright-langserver";
        args = [
          "--stdio"
        ];
      };
      config = { };
    }
  ];
}
