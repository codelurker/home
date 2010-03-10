#!/bin/bash
# Now Playing MOC Script
# By: MreDD
# mredd (at) 0tue0.com
# Small script to echo 
# Stop | Pause | and What MOC is playing Artist - Song CT/TT - VolBar
# for use w/IRC Apps.. Spam Your Music
#########

# Colors
# Forground



## Colors 16 - 255
a='\E[38;5;16m'
b='\E[38;5;17m'
c='\E[38;5;18m'
d='\E[38;5;19m'
e='\E[38;5;20m'
f='\E[38;5;21m'
g='\E[38;5;22m'
h='\E[38;5;23m'
i='\E[38;5;24m'
j='\E[38;5;25m'
k='\E[38;5;26m'
l='\E[38;5;27m'
m='\E[38;5;28m'
n='\E[38;5;29m'
o='\E[38;5;30m'
p='\E[38;5;31m'
q='\E[38;5;32m'
r='\E[38;5;33m'
s='\E[38;5;34m'
t='\E[38;5;35m'
u='\E[38;5;36m'
v='\E[38;5;37m'
w='\E[38;5;38m'
x='\E[38;5;39m'
y='\E[38;5;40m'
z='\E[38;5;41m'
aa='\E[38;5;42m'
bb='\E[38;5;43m'
cc='\E[38;5;44m'
dd='\E[38;5;45m'
ee='\E[38;5;46m'
ff='\E[38;5;47m'
gg='\E[38;5;48m'
hh='\E[38;5;49m'
ii='\E[38;5;50m'
jj='\E[38;5;51m'
kk='\E[38;5;52m'
ll='\E[38;5;53m'
mm='\E[38;5;54m'
nn='\E[38;5;55m'
oo='\E[38;5;56m'
pp='\E[38;5;57m'
qq='\E[38;5;58m'
rr='\E[38;5;59m'
ss='\E[38;5;60m'
tt='\E[38;5;61m'
uu='\E[38;5;62m'
vv='\E[38;5;63m'
ww='\E[38;5;64m'
xx='\E[38;5;65m'
yy='\E[38;5;66m'
zz='\E[38;5;67m'
aaa='\E[38;5;68m'
bbb='\E[38;5;69m'
ccc='\E[38;5;70m'
ddd='\E[38;5;71m'
eee='\E[38;5;72m'
fff='\E[38;5;73m'
ggg='\E[38;5;74m'
hhh='\E[38;5;75m'
iii='\E[38;5;76m'
jjj='\E[38;5;77m'
kkk='\E[38;5;78m'
lll='\E[38;5;79m'
mmm='\E[38;5;80m'
nnn='\E[38;5;81m'
ooo='\E[38;5;82m'
ppp='\E[38;5;83m'
qqq='\E[38;5;84m'
rrr='\E[38;5;85m'
sss='\E[38;5;86m'
ttt='\E[38;5;87m'
uuu='\E[38;5;88m'
vvv='\E[38;5;89m'
www='\E[38;5;90m'
xxx='\E[38;5;91m'
yyy='\E[38;5;92m'
zzz='\E[38;5;93m'
aaaa='\E[38;5;94m'
bbbb='\E[38;5;95m'
cccc='\E[38;5;96m'
dddd='\E[38;5;97m'
eeee='\E[38;5;98m'
ffff='\E[38;5;99m'
gggg='\E[38;5;100m'
hhhh='\E[38;5;101m'
iiii='\E[38;5;102m'
jjjj='\E[38;5;103m'
kkkk='\E[38;5;104m'
llll='\E[38;5;105m'
mmmm='\E[38;5;106m'
nnnn='\E[38;5;107m'
oooo='\E[38;5;108m'
pppp='\E[38;5;109m'
qqqq='\E[38;5;110m'
rrrr='\E[38;5;111m'
ssss='\E[38;5;112m'
tttt='\E[38;5;113m'
uuuu='\E[38;5;114m'
vvvv='\E[38;5;115m'
wwww='\E[38;5;116m'
xxxx='\E[38;5;117m'
yyyy='\E[38;5;118m'
zzzz='\E[38;5;119m'
aaaaa='\E[38;5;120m'
bbbbb='\E[38;5;121m'
ccccc='\E[38;5;122m'
ddddd='\E[38;5;123m'
eeeee='\E[38;5;124m'
fffff='\E[38;5;125m'
ggggg='\E[38;5;126m'
hhhhh='\E[38;5;127m'
iiiii='\E[38;5;128m'
jjjjj='\E[38;5;129m'
kkkkk='\E[38;5;130m'
lllll='\E[38;5;131m'
mmmmm='\E[38;5;132m'
nnnnn='\E[38;5;133m'
ooooo='\E[38;5;134m'
ppppp='\E[38;5;135m'
qqqqq='\E[38;5;136m'
rrrrr='\E[38;5;137m'
sssss='\E[38;5;138m'
ttttt='\E[38;5;139m'
uuuuu='\E[38;5;140m'
vvvvv='\E[38;5;141m'
wwwww='\E[38;5;142m'
xxxxx='\E[38;5;143m'
yyyyy='\E[38;5;144m'
zzzzz='\E[38;5;145m'
ab='\E[38;5;146m'
ac='\E[38;5;147m'
ad='\E[38;5;148m'
ae='\E[38;5;149m'
af='\E[38;5;150m'
ag='\E[38;5;151m'
ah='\E[38;5;152m'
ai='\E[38;5;153m'
aj='\E[38;5;154m'
ak='\E[38;5;155m'
al='\E[38;5;156m'
am='\E[38;5;157m'
an='\E[38;5;158m'
ao='\E[38;5;159m'
ap='\E[38;5;160m'
aq='\E[38;5;161m'
ar='\E[38;5;162m'
as='\E[38;5;163m'
at='\E[38;5;164m'
au='\E[38;5;165m'
av='\E[38;5;166m'
aw='\E[38;5;167m'
ax='\E[38;5;168m'
ay='\E[38;5;169m'
az='\E[38;5;170m'
abb='\E[38;5;171m'
acc='\E[38;5;172m'
add='\E[38;5;173m'
aee='\E[38;5;174m'
aff='\E[38;5;175m'
agg='\E[38;5;176m'
ahh='\E[38;5;177m'
aii='\E[38;5;178m'
ajj='\E[38;5;179m'
akk='\E[38;5;180m'
all='\E[38;5;181m'
amm='\E[38;5;182m'
ann='\E[38;5;183m'
aoo='\E[38;5;184m'
app='\E[38;5;185m'
aqq='\E[38;5;186m'
arr='\E[38;5;187m'
ass='\E[38;5;188m'
att='\E[38;5;189m'
auu='\E[38;5;190m'
avv='\E[38;5;191m'
aww='\E[38;5;192m'
axx='\E[38;5;193m'
ayy='\E[38;5;194m'
azz='\E[38;5;195m'
abbb='\E[38;5;196m'
accc='\E[38;5;197m'
addd='\E[38;5;198m'
aeee='\E[38;5;199m'
afff='\E[38;5;200m'
aggg='\E[38;5;201m'
ahhh='\E[38;5;202m'
aiii='\E[38;5;203m'
ajjj='\E[38;5;204m'
akkk='\E[38;5;205m'
alll='\E[38;5;206m'
ammm='\E[38;5;207m'
annn='\E[38;5;208m'
aooo='\E[38;5;209m'
appp='\E[38;5;210m'
aqqq='\E[38;5;211m'
arrr='\E[38;5;212m'
asss='\E[38;5;213m'
attt='\E[38;5;214m'
auuu='\E[38;5;215m'
avvv='\E[38;5;216m'
awww='\E[38;5;217m'
axxx='\E[38;5;218m'
ayyy='\E[38;5;219m'
azzz='\E[38;5;220m'
abbbb='\E[38;5;221m'
acccc='\E[38;5;222m'
adddd='\E[38;5;223m'
aeeee='\E[38;5;224m'
affff='\E[38;5;225m'
agggg='\E[38;5;226m'
ahhhh='\E[38;5;227m'
aiiii='\E[38;5;228m'
ajjjj='\E[38;5;229m'
akkkk='\E[38;5;230m'
allll='\E[38;5;231m'
ammmm='\E[38;5;232m'
annnn='\E[38;5;233m'
aoooo='\E[38;5;234m'
apppp='\E[38;5;235m'
aqqqq='\E[38;5;236m'
arrrr='\E[38;5;237m'
assss='\E[38;5;238m'
atttt='\E[38;5;239m'
auuuu='\E[38;5;240m'
avvvv='\E[38;5;241m'
awwww='\E[38;5;242m'
axxxx='\E[38;5;243m'
ayyyy='\E[38;5;244m'
azzzz='\E[38;5;245m'
aba='\E[38;5;246m'
aca='\E[38;5;247m'
ada='\E[38;5;248m'
aea='\E[38;5;249m'
afa='\E[38;5;250m'
aga='\E[38;5;251m'
aha='\E[38;5;252m'
aia='\E[38;5;253m'
aja='\E[38;5;254m'
aka='\E[38;5;255m'
TR='\E[0m'    # Text Reset
##
# End Colors
##
# Variables
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`
ALBUM=`mocp -i | grep Album | cut -f2 -d ":"`
CS=`mocp -i | grep 'CurrentSec' | awk '{print $2}'`
TS=`mocp -i | grep 'TotalSec' | awk '{print $2}'`
PERCENT=`bc << EOF
100.0 * $CS / $TS
EOF
`

if [ "$INFO" == "State: STOP" ];then 
    echo -ne "${aqqqq}MOC${gggg}: ${mmmm}[${aqqqq}stop${mmmm}] "
    echo ""
elif [ "$STATE" == "State: PAUSE" ];then 
    echo -ne "${aqqqq}MOC${gggg}:${zz} |${xxxx}pause${zz}| "
    echo ""
else
PBARS=$(expr $PERCENT / 10 | cut -c01-01)
#
case $PBARS in
        0)
                PBAR=$(echo -e "${kk}[${annn}>${TR}${jj}---------${kk}]")
                ;;        
        1)
                PBAR=$(echo -e "${R}[${annn}o${TR}${jj}---------${kk}]")
                ;;
        2)
                PBAR=$(echo -e "${kk}[${jj}-${annn}o${TR}${jj}--------${kk}]")
                ;;
        3)
                PBAR=$(echo -e "${kk}[${jj}--${annn}o${TR}${jj}-------${kk}]")
                ;;
        4)
                PBAR=$(echo -e "${kk}[${jj}---${annn}o${TR}${jj}------${kk}]")
                ;;
        5)
                PBAR=$(echo -e "${kk}[${jj}----${annn}o${TR}${jj}-----${kk}]")
                ;;
        6)
                PBAR=$(echo -e "${kk}[${jj}-----${annn}o${TR}${jj}----${kk}]")
                ;;
        7)
                PBAR=$(echo -e "${kk}[${jj}------${annn}o${TR}${jj}---${kk}]")
                ;;
        8)
                PBAR=$(echo -e "${kk}[${jj}-------${annn}o${TR}${jj}--${kk}]")
                ;;
        9)
                PBAR=$(echo -e "${kk}[${jj}--------${annn}o${TR}${jj}-${kk}]")
                ;;
        10)
                PBAR=$(echo -e "${kk}[${jj}---------${annn}O${TR}${kk}]")
                ;;
        *)
                PBAR=$(echo -e "${kk}[${annn}oooooooooo${TR}${kk}]")
esac
##
# Vol-Bar
VOLUME=$(amixer sget 'PCM' | tail -n 1 | awk '{print $5}' | tr -d []%)
VBARS=$(expr $VOLUME / 10)
case $VBARS in
        1)
                VBAR=$(echo -e "${gggg}[${rrrr}|${annnn}---------${gggg}]")
                ;;
        2)
                VBAR=$(echo -e "${gggg}[${rrrr}||${annnn}--------${gggg}]")
                ;;
        3)
                VBAR=$(echo -e "${gggg}[${rrrr}|||${annnn}-------${gggg}]")
                ;;
        4)
                VBAR=$(echo -e "${gggg}[${rrrr}||||${annnn}------${gggg}]")
                ;;
        5)
                VBAR=$(echo -e "${gggg}[${rrrr}|||||${annnn}-----${gggg}]")
                ;;
        6)
                VBAR=$(echo -e "${gggg}[${rrrr}||||||${annnn}----${gggg}]")
                ;;
        7)
                VBAR=$(echo -e "${gggg}[${rrrr}|||||||${annnn}---${gggg}]")
                ;;
        8)
                VBAR=$(echo -e "${gggg}[${rrrr}||||||||${annnn}--${gggg}]")
                ;;
        9)
                VBAR=$(echo -e "${gggg}[${rrrr}|||||||||${annnn}-${gggg}]")
                ;;
        10)
                VBAR=$(echo -e "${gggg}[${rrrr}||||||||||${gggg}]")
                ;;
        *)
                VBAR=$(echo -e "${gggg}[${annnn}----------${gggg}]")
esac
STATE="$VOLUME"
if [ $STATE == "0" ]; then
    VOL="Muted: $VBAR"
else
    VOL="${afa}Vol${aqqqq}: $VBAR"
fi 
VOLBAR=$(~/.wmii-hg/scripts/vol-bar.sh)
echo -ne "${nnn}np${aqqqq}:${ggg}$ARTIST ${mmmm}-${uuuu}$TITLE ${mmmm}|${ggg}$ALBUM $PBAR ${an}(${aq}$PERCENT${ap}%${an}) $VOL"
echo ""
fi
