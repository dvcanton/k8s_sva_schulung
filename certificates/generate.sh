#!/bin/bash

# Author: Dave Canton
# Email: dave.canton@sva.de
# Status: 18.03.2022

display_help() {
    echo "Usage: `basename $0` {generate|validade}" >&2
    echo
    exit 1
}

display_function_help() {
    echo "Usage: `basename $0` $1 $2 {ca|server_cert|client_cert}" >&2
    echo
    exit 1
}

generate() {
	case "$1" in
	ca)
		# Private key for CA
		openssl genrsa -out ca_key.pem 2048
		# Self-signed root CA 
		openssl req -x509 -sha256 -new -nodes -key ca_key.pem -days 3650 -out ca_cert.pem
		openssl x509 -outform der -in ca_cert.pem -out ca_cert.crt

		;;

	server_cert)
		# Private key and csr
		openssl req -newkey rsa:2048 -nodes -days 365000 -keyout server_key.pem -out server_csr.pem
		# Certificate
		openssl x509 -req -days 365000 -set_serial 01  -in server_csr.pem  -out server_cert.pem -CA ca_cert.pem  -CAkey ca_key.pem
		;;
	client_cert)
		# Private key and csr
		openssl req -newkey rsa:2048 -nodes -days 365000 -keyout client_key.pem  -out client_csr.pem
		# Certificate
		openssl x509 -req -days 365000 -set_serial 01 -in client_csr.pem -out client_cert.pem  -CA ca_cert.pem -CAkey ca_key.pem
		;;
	*)
		display_function_help generate
		exit 1
		;;
	esac
	
}

validate() {
	case "$1" in
	ca)
		# Review CA
		openssl x509 -in ca_cert.pem -text
		;;

	server_cert)
		# Review server certificate
		openssl verify -CAfile ca_cert.pem ca_cert.pem server_cert.pem
		;;
	client_cert)
		# Review client certificate
		openssl verify -CAfile ca_cert.pem ca_cert.pem client_cert.pem
		;;

	*)
		display_function_help validate
		exit 1
		;;
	esac
	

}

case "$1" in
  generate)
    generate $2
    ;;
  validate)
    validate $2
    ;;
  *)
#    echo "Usage: $0 {start|stop|restart}" >&2
     display_help
     exit 1
     ;;
esac