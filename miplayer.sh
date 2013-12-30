#!/bin/bash
#################################
########### MiPlayer ############
#################################

#list all mp3 files
function list {
  pwd
  count=0
  for f in *.mp*; do
    echo "$f"
    songs[count]=$f;
  done
  
}

#play all mp3 files in a directory
function play {
   echo "Playing all items in the current directory"
   for f in *.mp* ; do 
    ffplay -vn -loglevel debug -nodisp -autoexit "$f"; 
   done
}

#play all - repeat
function playrepeat {
   echo "Playing all items in the current directory"
   for f in *.mp* ; do 
    ffplay -vn -loglevel debug -nodisp -autoexit "$f"; 
   done
   playrepeat
}


#Selection Menu
PS3='Please enter your choice: '
options=("List All" "Play All Once" "Play All Repeat" "Play Selection" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"List All")
	    list
	    ;;
	"Play All Once")
	    play
	    ;;
	"Play All Repeat")
	    playrepeat
	    ;;
	"Play Selection")
	    echo "Still under development"
	    ;;
	"Quit")
	    break
	    ;;
	*) echo invalid option;;
    esac
done


