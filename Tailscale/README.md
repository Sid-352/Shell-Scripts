## Tailscale, my new favourite tool

What is Tailscale?

Its a vpn tool that allows you to tunnel your devices through the internet without needing to port forward or even poke holes in your firewall, and even bypasses NAT. Is it fast? Yes. Is it free? Kinda, not FOSS but free nonetheless. What is so good about it? Well it isnt protocol-bound and I guess it will be better if you just visit their website and follow the instructions:

[It's right here!](https://tailscale.com/)

I tried every other option under the sun to connect to my server remotely for free(no money required). Tailscale generally allows only internalm traffic of any kind but can be accessed outisde using a something very interesting called Tailscale funnel.

Anyhow, tailscale will not work well with the ngrok-systemd service.

Try it, also supports android (maybe even ssh in android but I didn't try it).
