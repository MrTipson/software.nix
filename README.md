# multiseat-nix
Nix packages and DE/WM patches for single GPU multiseat using [drm-lease-manager](https://github.com/AGLExport/drm-lease-manager).

## How it works
`drm-lease-manager` runs as a system service, allowing clients (display servers) to request and lease individual connectors. To communicate with the server, it's client library which needs to be integrated for each desktop environment.

## What can you do with it
I use it for running steam big picture mode on my tv in a cage session, but stuff you could probably do are also:
- having multiple workstations on the same pc
- remote game streaming (maybe???)

## Can I use this on other distros?
The patches should work fine anywhere, but setting up and building everything will be more annoying. The nix package definitions may still be useful in some cases, but they require some understanding of the nix language and derivations.

## Example
You can take a look at [my configuration](https://github.com/MrTipson/systems.nix/blob/master/modules/multiseat.nix) for reference on my steam big picture setup.

Some tips if you're looking do try this for yourself:
- clients may get stuck if trying to take the whole gpu while `drm-lease-manager` is running. Changing VT (`ctrl+alt+f1-f6`) or using ssh to kill sessions (`loginctl list-sessions`, `loginctl kill-session`) can be useful.
- clients should only require `DRM_LEASE` in the environment (e.g. `DRM_LEASE=card1-DP-3`), but in some cases this is not enough (e.g. i set `WLR_DRM_DEVICES` for cage).
- if you want to have a graphical display manager, it probably needs to be patched to also lease a connector, but it must also be configured to export the lease env to a client.