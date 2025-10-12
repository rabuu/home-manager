{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      default_shell = "fish";
      default_layout = "compact";
      simplified_ui = true;
      pane_frames = false;
      show_startup_tips = false;

      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };

      theme = "gruvbox-dark";

      keybinds._props.clear-defaults = true;
      keybinds.tab._children = [
        {
          bind = {
            _args = ["n"];
            _children = [
              { NewTab = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["r"];
            _children = [
              { SwitchToMode._args = ["RenameTab"]; }
              { TabNameInput._args = [0]; }
            ];
          };
        }
        {
          bind = {
            _args = ["x"];
            _children = [
              { CloseTab = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["0"];
            _children = [
              { ToggleTab = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["1"];
            _children = [
              { GoToTab._args = [1]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["2"];
            _children = [
              { GoToTab._args = [2]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["3"];
            _children = [
              { GoToTab._args = [3]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["4"];
            _children = [
              { GoToTab._args = [4]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["5"];
            _children = [
              { GoToTab._args = [5]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["6"];
            _children = [
              { GoToTab._args = [6]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["7"];
            _children = [
              { GoToTab._args = [7]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["8"];
            _children = [
              { GoToTab._args = [8]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["9"];
            _children = [
              { GoToTab._args = [9]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
      ];
      keybinds.renametab._children = [
        {
          bind = {
            _args = ["Ctrl c" "Esc"];
            _children = [
              { UndoRenameTab = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
      ];
      keybinds.pane._children = [
        {
          bind = {
            _args = ["h" "Left"];
            _children = [ { MoveFocus._args = ["Left"]; } ];
          };
        }
        {
          bind = {
            _args = ["j" "Down"];
            _children = [ { MoveFocus._args = ["Down"]; } ];
          };
        }
        {
          bind = {
            _args = ["k" "Up"];
            _children = [ { MoveFocus._args = ["Up"]; } ];
          };
        }
        {
          bind = {
            _args = ["l" "Right"];
            _children = [ { MoveFocus._args = ["Right"]; } ];
          };
        }
        {
          bind = {
            _args = ["n"];
            _children = [
              { NewPane = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["|"];
            _children = [
              { NewPane._args = ["Right"]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["-"];
            _children = [
              { NewPane._args = ["Down"]; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["f"];
            _children = [
              { TogglePaneFrames = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["m"];
            _children = [
              { SwitchToMode._args = ["Move"]; }
            ];
          };
        }
      ];
      keybinds.move._children = [
        {
          bind = {
            _args = ["h" "Left"];
            _children = [ { MovePane._args = ["Left"]; } ];
          };
        }
        {
          bind = {
            _args = ["j" "Down"];
            _children = [ { MovePane._args = ["Down"]; } ];
          };
        }
        {
          bind = {
            _args = ["k" "Up"];
            _children = [ { MovePane._args = ["Up"]; } ];
          };
        }
        {
          bind = {
            _args = ["l" "Right"];
            _children = [ { MovePane._args = ["Right"]; } ];
          };
        }
      ];
      keybinds.resize._children = [
        {
          bind = {
            _args = ["h" "Left"];
            _children = [ { Resize._args = ["Increase Left"]; } ];
          };
        }
        {
          bind = {
            _args = ["j" "Down"];
            _children = [ { Resize._args = ["Increase Down"]; } ];
          };
        }
        {
          bind = {
            _args = ["k" "Up"];
            _children = [ { Resize._args = ["Increase Up"]; } ];
          };
        }
        {
          bind = {
            _args = ["l" "Right"];
            _children = [ { Resize._args = ["Increase Right"]; } ];
          };
        }
      ];
      keybinds.scroll._children = [
        {
          bind = {
            _args = ["s" "/"];
            _children = [
              { SwitchToMode._args = ["EnterSearch"]; }
              { SearchInput._args = [0]; }
            ];
          };
        }
        {
          bind = {
            _args = ["Ctrl c" "q" "Esc"];
            _children = [
              { ScrollToBottom = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["j" "Down"];
            _children = [
              { ScrollDown = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["k" "Up"];
            _children = [
              { ScrollUp = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["d"];
            _children = [
              { HalfPageScrollDown = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["u"];
            _children = [
              { HalfPageScrollUp = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["n"];
            _children = [
              { Search._args = ["Down"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["p"];
            _children = [
              { Search._args = ["Up"]; }
            ];
          };
        }
      ];
      keybinds.search._children = [
        {
          bind = {
            _args = ["s" "/"];
            _children = [
              { SwitchToMode._args = ["EnterSearch"]; }
              { SearchInput._args = [0]; }
            ];
          };
        }
        {
          bind = {
            _args = ["Ctrl c" "q" "Esc"];
            _children = [
              { ScrollToBottom = {}; }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["j" "Down"];
            _children = [
              { ScrollDown = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["k" "Up"];
            _children = [
              { ScrollUp = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["d"];
            _children = [
              { HalfPageScrollDown = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["u"];
            _children = [
              { HalfPageScrollUp = {}; }
            ];
          };
        }
        {
          bind = {
            _args = ["n"];
            _children = [
              { Search._args = ["Down"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["p"];
            _children = [
              { Search._args = ["Up"]; }
            ];
          };
        }
      ];
      keybinds.entersearch._children = [
        {
          bind = {
            _args = ["Ctrl c" "Esc"];
            _children = [
              { SwitchToMode._args = ["Scroll"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["Enter"];
            _children = [
              { SwitchToMode._args = ["Search"]; }
            ];
          };
        }
      ];
      keybinds."shared_except \"normal\""._children = [
        {
          bind = {
            _args = ["Esc" "Enter"];
            _children = [ { SwitchToMode._args = ["Normal"]; } ];
          };
        }
      ];
      keybinds.shared._children = [
        {
          bind = {
            _args = ["Alt t"];
            _children = [ { SwitchToMode._args = ["Tab"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt p"];
            _children = [ { SwitchToMode._args = ["Pane"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt r"];
            _children = [ { SwitchToMode._args = ["Resize"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt /"];
            _children = [ { SwitchToMode._args = ["Scroll"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt w"];
            _children = [
              {
                LaunchOrFocusPlugin = {
                  _args = ["session-manager"];
                  _children = [
                    { floating._args = [true]; }
                    { move_to_focused_tab._args = [true]; }
                  ];
                };
              }
              { SwitchToMode._args = ["Normal"]; }
            ];
          };
        }
        {
          bind = {
            _args = ["Alt q"];
            _children = [ { Quit = {}; } ];
          };
        }
        {
          bind = {
            _args = ["Alt h" "Alt Left"];
            _children = [ { MoveFocus._args = ["Left"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt j" "Alt Down"];
            _children = [ { MoveFocus._args = ["Down"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt k" "Alt Up"];
            _children = [ { MoveFocus._args = ["Up"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt l" "Alt Right"];
            _children = [ { MoveFocus._args = ["Right"]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt n"];
            _children = [ { NewTab = {}; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 0"];
            _children = [ { ToggleTab = {}; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 1"];
            _children = [ { GoToTab._args = [1]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 2"];
            _children = [ { GoToTab._args = [2]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 3"];
            _children = [ { GoToTab._args = [3]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 4"];
            _children = [ { GoToTab._args = [4]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 5"];
            _children = [ { GoToTab._args = [5]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 6"];
            _children = [ { GoToTab._args = [6]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 7"];
            _children = [ { GoToTab._args = [7]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 8"];
            _children = [ { GoToTab._args = [8]; } ];
          };
        }
        {
          bind = {
            _args = ["Alt 9"];
            _children = [ { GoToTab._args = [9]; } ];
          };
        }
      ];
    };
  };
}
