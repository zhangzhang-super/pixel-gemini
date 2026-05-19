# Nix configuration for Replit - includes Python and Chromium
{ pkgs }: {
  deps = [
    # Python 3.10
    pkgs.python310
    pkgs.python310Packages.pip
    
    # Chromium browser for Selenium automation
    pkgs.chromium
    pkgs.chromedriver
    
    # Additional system dependencies
    pkgs.glib
    pkgs.glibc
    pkgs.nss
    pkgs.nspr
    pkgs.atk
    pkgs.cups
    pkgs.dbus
    pkgs.libdrm
    pkgs.gtk3
    pkgs.pango
    pkgs.cairo
    pkgs.xorg.libX11
    pkgs.xorg.libXcomposite
    pkgs.xorg.libXdamage
    pkgs.xorg.libXext
    pkgs.xorg.libXfixes
    pkgs.xorg.libXrandr
    pkgs.mesa
    pkgs.alsa-lib
    pkgs.expat
    pkgs.xorg.libxcb
    pkgs.libxkbcommon
    pkgs.xorg.libxshmfence
  ];
  
  # Environment variables
  env = {
    # Point to Chromium binary
    CHROME_BIN = "${pkgs.chromium}/bin/chromium";
    CHROMEDRIVER_PATH = "${pkgs.chromedriver}/bin/chromedriver";
    
    # Required for headless Chrome
    DISPLAY = ":0";
  };
}
