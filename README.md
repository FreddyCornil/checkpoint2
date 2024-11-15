#### Exercice 1
  - Question 1.1 :  
    * Pour que les machines puissent communiquer entre elles, il faut qu'elles soient sur le même réseau.
Il faut donc modifier l'adresse réseau statique de la machine cliente en la passant de ````172.16.100.50/24```` vers ````172.16.10.50/24````
![img1](./exo1_5.png)
![im2](./exo1_6.png)
![im3](./exo1_7.png)

  - Question 1.3 :
    * En DHCP, l'adresse IP attribuée à la machine cliente est ````172.16.10.20````  
L'adresse attribuée correspond à la première disponible après la plage d'exclusion ````172.16.10.1 - 172.16.10.19````    
![im4](./exo1_8.png)
![im4](./exo1_10.png)

  - Question 1.4 :
    * La machine cliente peut avoir l'IP ````172.16.10.15````, il suffit de lui réserver l'adresse statique sur le serveur DHCP
![im4](./exo1_11.png)
![im4](./exo1_12.png)

#### Exercice 2
  - Question 2.1 :
    * voir le fichier [Main.ps1](https://github.com/FreddyCornil/checkpoint2/blob/main/Main.ps1)
  - Question 2.2 à 2.11 :
    * voir le fichier [AddLocalUsers.ps1](https://github.com/FreddyCornil/checkpoint2/blob/main/AddLocalUsers.ps1)

#### Exercice 3
  - Question 3.1 :  
    * Le matériel réseau A est un commutateur (switch), il permet de connecter plusieurs matériels entre eux au sein d'un réseau local

  - Question 3.2 :
    * Le matériel réseau B est un routeur, il permet de gérer le trafiic, router les paquets et interconnecter plusieurs réseaux

 - Question 3.3 :
    * f0/0 désigne le port FastEthernet 0/0
    * g0/0 désigne la port GigabitEthernet 0/0
      
 - Question 3.4 :
    * ````/16```` représente le masque de sous réseau en notation CIDR

 - Question 3.5 :
    * ````10.10.255.254```` est la passerelle du réseau auquel PC2 est connecté, néanmoins vu son adresse IP ````10.11.80.2/16````, il ne doit pas être configuré correctement

 - Question 3.6 :
    * Pour les ordinateur PC1, PC2, et PC5
      - L'adresse réseau est : 10.10.0.0
      - La première adresse disponibles est : 10.10.0.1
      - La dernière adresse disponible est : 10.10.0.254
      - L'adresse de diffusion est : 10.10.255.255

 - Question 3.7 :
    * PC1, PC3, PC4, PC5 vont pouvoir communiquer entre eux

 - Question 3.8 :
    * PC1, PC3, PC4, PC5 pourront attendre le réseau 172.16.5.0/24

 - Question 3.9 :
    * Il n'y aura aucune incidence

 - Question 3.10 :
    * Il faut connecter un serveur DHCP sur le switch et paramétrer les PC en DHCP 


