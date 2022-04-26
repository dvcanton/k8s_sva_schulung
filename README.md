# k8s_sva_schulung

In diesem Handson-Teil der Schulung wird die folgenden Themen beigebracht: 
  - Helm Chart Deployments
  - K8s-Secret Erstellung mit kubectl
  - Installierung eines Operator
  -  DevOps einer K8s-Umgebung

Hierzu wurde eine Demo-Umgebung vorbereitet. Es bestehe auf eine Webanwendung mit zwei Komponenten. 
Das Frontend, auch Vue-Frontend gennat, liefert die App an Benutzer und läuft auf den Browser wenn sie 
aufgeruft ist. Diese Komponent verbindet sich mit dem Backend, um Daten für seine Logik abzufragen.

## Die Applikation
Wordle ist ein Online-Mini-Quiz und hat die Welt vor Kurzen übernommen. Laut New York Times spielen täglich
Millionen Menschen das Rätselspiel. Ziel dazu: mit nur sechs Versuchen ein fünfbuchstabiges Wort zu finden. 
Das Wort ändert sich jeden Tag. Ein fünfbuchstabiges Wort auf English kann einfach doch zu finden, wie "Black" oder "White", 
allerdings wenn das Spiel schon gespielt hat, weiß genau den Moment wenn kein Wort mehr in Kopf kommt. Man steckt auf dem Spiel fest, 
es geht nicht weiter. Dazu kommt diese App! 

Die App ist ein Generator für Worten, die man in Wordle nutzen kann, um zummindest weiter zu spielen und 
endlich schlafen gehen zu können, bevor bloß für einen Versuch 30min gegangen sind.

## Die Architektur
[Bild]


## Voraussetzung

*kubectl*: Kommandozeiletool (CLI) damit man Befehlen in einem Kubernetes-Cluster ausführen kann. Es kommuniziert mit der K8s-API und ermöglich man eine Anwendungen zu bereitzustellen sowohl als Clusterressourcen zu überwachen und Logs zu überprüfen. 

Ubuntu oder WSL2: 
```
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y k<ubectl
```

*Helm*: Ein Paketmanager für Kubernetes, damit man Anwendungen in einem K8s-Cluster bereitzustellen kann, es ermöglich mehrere Szenarien verwendet werden und bietet Flexibilität für die Installation und Aktualisierung einer K8s-Applikation.

Ubuntu oder WSL2:
```
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```


## 1. Bereitstellung des Backends


## 2. Bereitstellung des Frontend

## 3. SSL-Aktivierung

## 4. Automatische Erzeungung von Zertifikate


