{ pkgs, ... }:
{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };

  # HACK(2025-08-03): Fish completion not working OOTB for pass
  xdg.configFile."fish/completions/pass.fish" = {
    source = "${pkgs.pass}/share/fish/vendor_completions.d/pass.fish";
  };
}
