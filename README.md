```
████████╗ ██████╗ ██╗   ██╗ ██████╗██╗  ██╗    ███████╗██╗   ██╗██████╗  ██████╗
╚══██╔══╝██╔═══██╗██║   ██║██╔════╝██║  ██║    ██╔════╝██║   ██║██╔══██╗██╔═══██╗
   ██║   ██║   ██║██║   ██║██║     ███████║    ███████╗██║   ██║██║  ██║██║   ██║
   ██║   ██║   ██║██║   ██║██║     ██╔══██║    ╚════██║██║   ██║██║  ██║██║   ██║
   ██║   ╚██████╔╝╚██████╔╝╚██████╗██║  ██║    ███████║╚██████╔╝██████╔╝╚██████╔╝
   ╚═╝    ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝
```

> Use Touch ID for sudo.

Have you ever been frustrated by having to type in your password on your mac every single time  
inspite of having Touch ID?  
Behold, touchsudo.  
A simple script that enables Touch ID control of sudo.

Credits to [tw93/Mole](https://github.com/tw93/Mole) for the core functionality. 

<img src="touchsudo.png" alt="touchsudo" width="400">

---

## Installation

### Homebrew (Recommended)

```bash
brew tap kashyap07/homebrew-touchsudo
brew install touchsudo
```

### Manual

```bash
curl -fsSL https://raw.githubusercontent.com/kashyap07/homebrew-touchsudo/main/touchsudo -o /usr/local/bin/touchsudo
chmod +x /usr/local/bin/touchsudo
```

## Usage

```bash
# Interactive mode (shows banner + toggle)
touchsudo

# Enable Touch ID for sudo
touchsudo enable

# Disable Touch ID for sudo
touchsudo disable

# Check current status
touchsudo status
```

## How It Works

touchsudo configures macOS PAM (Pluggable Authentication Module) to accept Touch ID for sudo authentication. It:

1. Detects your macOS version (Sonoma+ uses `sudo_local`, older versions modify `sudo` directly)
2. Adds `pam_tid.so` to the appropriate PAM configuration
3. Creates backups before making changes

## Compatibility

| macOS Version | Method                                                          |
| ------------- | --------------------------------------------------------------- |
| Sonoma (14+)  | Uses `/etc/pam.d/sudo_local` (survives updates)                 |
| Older         | Modifies `/etc/pam.d/sudo` (may need re-enabling after updates) |

## Requirements

- macOS with Touch ID (MacBook Pro 2016+, MacBook Air 2018+, or Mac with Magic Keyboard with Touch ID)
- Admin privileges (for modifying PAM configuration)

## Uninstall

```bash
# Disable Touch ID first
touchsudo disable

# Remove via Homebrew
brew uninstall touchsudo
brew untap kashyap07/homebrew-touchsudo

# Or remove manually
rm /usr/local/bin/touchsudo
```

## License

MIT
