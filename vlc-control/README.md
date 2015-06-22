# Rubik’s Futurocube remote for VLC media player

## Ovládání:

Pro první použití doporuèujeme umístit Futurocube tak, aby zapojený USB kabel smìøoval smìrem od Vás a byl co nejblíže ploše stolu. Tzn. aby bylo znaménko plus na pravé stranì Futurocube z Vašeho pohledu. Z tohoto umístìní vychází následující pokyny a také logika orientace symbolù a ovladaèù.

uknutím na horní stranu Futurocube se symbolem doprava smìøující šipky (>) pøehrávanou stopu zastavíte, nebo zastavenou stopu opìt spustíte. Stejného výsledku, jako poklepáním na horní stìnu Futurocube dosáhnete také poklepem na stùl. Až do vzdálenosti 20 cm od Futurocube staèí do stolu poklepat jedním prstem bez pøílišného vynaložení síly, avšak pøi silnìjším poklepání zaznamená Futurocube vibrace i pøes celý stùl. (Tuto funkci lze deaktivovat pootoèením Futurocube na stranu protilehlou konektoru USB.)

Poklepy na levou a pravou stranu Futurocube se znaménky + a – lze snadno ovládat nastavení hlasitosti VLC media player.


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
