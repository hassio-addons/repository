## What’s changed

So, the first release had bugs and needed improvements 😬 
But this release fixes a lot of them! Thanks for the feedback and reports 👍 

Subnet & Exit node routing has been fixed, additionally, the add-on will now only expose subnets that can be routed on your system.

## 🐛 Bug fixes

- 🚑 Use netfilter for iptables @frenck (#17)

## 🚀 Enhancements

- 💄 Update sidebar icon from Docker -> VPN @frenck (#11)
- 👕 Skip local link addresses in routes advertisement @frenck (#18)
- 👕 Skip address family from route advertisement if it has forwarding disabled @frenck (#19)

## 📚 Documentation

- 📚 Adjust i386 badge, as that is a supported architecture @frenck (#7)

## ⬆️ Dependency updates

- Bump docker/build-push-action from 2.6.1 to 2.7.0 @dependabot (#15)
- ⬆️ Upgrades Tailscale to 1.14.0 @frenck (#16)
