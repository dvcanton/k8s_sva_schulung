# Install


CertManager Version 1.7.1
```sh
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml
```

# CA Konfiguration 

```sh
kubectl create secret generic ca-key-par --from-file=tls.crt=ca_cert.pem --from-file=tls.key=ca_key.pem
```

# Provider erstellen

```
helm install cert-provider .
```