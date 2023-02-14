
# Creating sealed secrets for cloudflare's API token

in the controller, run:
```bash
kubeseal < secret-cloudflare-token-template.yaml
```

copy the resulting output to `secret-cloudflare-token.json`