# Rubik�s Futurocube remote for VLC media player

## Ovl�d�n�:

Pro prvn� pou�it� doporu�ujeme um�stit Futurocube tak, aby zapojen� USB kabel sm��oval sm�rem od V�s a byl co nejbl�e plo�e stolu. Tzn. aby bylo znam�nko plus na prav� stran� Futurocube z�Va�eho pohledu. Z�tohoto um�st�n� vych�z� n�sleduj�c� pokyny a tak� logika orientace symbol� a ovlada��.

�uknut�m na horn� stranu Futurocube se symbolem doprava sm��uj�c� �ipky (>) p�ehr�vanou stopu zastav�te, nebo zastavenou stopu op�t spust�te. Stejn�ho v�sledku, jako poklep�n�m na horn� st�nu Futurocube dos�hnete tak� poklepem na st�l. A� do vzd�lenosti 20 cm od Futurocube sta�� do stolu poklepat jedn�m prstem bez p��li�n�ho vynalo�en� s�ly, av�ak p�i siln�j��m poklep�n� zaznamen� Futurocube vibrace i p�es�cel� st�l. (Tuto funkci lze deaktivovat pooto�en�m Futurocube na stranu protilehlou konektoru USB.)

Poklepy na levou a pravou stranu Futurocube se znam�nky + a � lze snadno ovl�dat nastaven� hlasitosti VLC media player.


## Setting up VLC for communication with futurocube

In your VLC

Go to tools- prefferences- all - interface - main interface - and check Web

Then go to  Lua (unfold main interface)  -and set up your password, host and port

host -localhost

port -8080

password -12345

Save and restart your VLC.

Download Node from this page - https://nodejs.org/

Install and then start command prompt

Install VLC control by typing  `npm install vlc-control-node futurocube-serial`  and pressing enter

Now you are ready to use our VLC control programme.
