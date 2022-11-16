
####### special space ##########
#  h for help
#
#
#
# 
######## Globle variables #######
TRUE=1
FALSE=0


system="system.c"
lang=$(cat $HOME/.c_pro/text/temp2)

lang1="$lang$system"
lang2=".$lang"

C=".$lang"

# setting random name

name=$(($RANDOM%1000))
if [ $name -lt 100 ]
 then

  name=$(($name+100))

 fi

 name1=$name
###### setting compiler ######

if [ "$lang" == "c" ]
then

 compiler="clang"

else
 
 compiler="clang++"
 
fi  






# removing some residues

a=$(cat $HOME/.c_pro/text/temp)
echo $PWD > $HOME/.c_pro/text/temp

if [ -f $a/a.out ];                   # a.out handling 
then
rm $a/a.out

elif [ -f $HOME/.c_pro/programs/$lang/a.out ];
then
rm $HOME/.c_pro/programs/$lang/a.out
fi



clear



#########   functions  ##########



 clean()
 {

    if [ -f "a.out" ]
    then
    rm $PWD/a.out
    fi
 }


 acci()                               # immidiate access
 {
    num=1
   cd $1
   for i in $(ls)
    do

     if [ $2 -eq $num ]
     then
      name=$i
      break
     fi
     num=$(($num+1))

   done  
 }

 
 lng() {
  
    echo $1 > $HOME/.c_pro/text/temp2 
    c.sh
    exit
   
  }
  
 rcol() {

   bstcol=( 1 2 3 5 6 11 13 14 15  33 51 57 63 64 68 100 106 111 123 128 130 131 134 136 
            140 142 141 143 147 148 153 154 159 165 166 189 190 206 211 214 218 220 226 
            255 )

    num=$(($RANDOM%45))
    # returning desire color
    col ${bstcol[num]}
    
   }
   
  blank() {

  if [ -z $1 ];
   then
   start
   exit
  fi
 }

 search() {

   if [ ! -f "$1" ]
   then

     col 21  
     e 2
     echo "file not found .."
     stop
     start
     exit
     
   fi

  }

 stop() {

  read y

 }


 e() {

   local x=1
   while [ $x -le $1 ]
   do
    echo 
    x=$(( $x + 1 ))
   done

  }

  error() {

   if [ -f "a.out" ];
   then
   return 0

   else
   stop 
   cd $HOME/.c_pro/programs/$lang/
   n $name

   clear
   e 2
   col 2
   echo " ..please wait compiling programm"
   e 2
   
   $compiler $name
   error
   return 1
   fi
   clear
   
  }


  str() {
   
   name=$1
   name=${name%.*}
   name="$name$C"

   # checking file exist or not

   if [ -f $name ];
   then


   char=( ok by pe to go oh no so oy ho io ro wi gt pt xx xo ox oo zz it )
   str=$(($RANDOM%17))
  
   name=${name%.c*}
   rnd=${char[str]}
   name="$name$rnd$C"
   e 2
   col 196
   printf "WARNING :  name is changed.. "  
   stop

   fi
 
  }
   
 code() {

  
   unset y

   

  if [ "$op" = "1" ]
   then
   
   # changing directory
   cd $HOME/.c_pro/programs/$lang/
   
   clear
   e 1
   col 120
   echo "> choose different name : "
   rcol
   echo  ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"
   e 1
   
   ls -x $HOME/.c_pro/programs/$lang/
   e 1

   rcol
   echo "......................................................................................."
   e 1

   rcol

   read  -p "> Enter the name :[ name$C ]:-: " name
   blank $name

 fi
  
   # opening nano                                           
 
   str $name
   touch $name
   cat $HOME/.c_pro/text/$lang1>>$name
   
  
  while [ -z "$y"  ] 
  do

   # removing a.out
   clean
   
   n $name

   
    clear
    e 2
    col 2
    echo " ..please wait compiling programm"
    e 2
    # running programm
    $compiler $name
   
    # checking error
    error $name
  
   # running programm
 
   rcol
   clear
   
   ./a.out
   e 4
   col 236
   echo "press 1 to exit.."
   e 4
   stop

 done

 unset y


   # renaming files
   name2=${name%.c*}
   mv a.out $name2
   
   # moving files
   mv $name $HOME/.c_pro/programs/$lang
   mv $name2 $HOME/.c_pro/output/$lang
   clear
   
   # calling code

   if [ "$op" = "1" ]
   then
    code

   else
    name=$(($name1+1)) 
    name1=$name
    fi

    stop
 }

 check() {

   clear
   rcol 
   e 2
   echo "......................"

   e 1
   rcol
   echo "1) Check Programs"

   e 1
   rcol
   echo "2) Check Output"

   e 1
   rcol
   echo "3) pro_test"
   
   e 1
   rcol
   echo "......................."

   e 2
   col 183
   read  -p '@> CHOICE : ' choice
   blank $choice

   case $choice in   

   1) check_pro ;;

   2) check_opt ;;

   3) pro_test ;;
   
   *) check    ;;

   esac

   # calling check
   check
 }


 check_pro() {

      clear
      e 1
      rcol
      cd $HOME/.c_pro/programs/$lang/ 
      echo "..................................................................................."
      e 1

      ls $HOME/.c_pro/programs/$lang/

      e 1
      rcol
      echo  "..................................................................................."
      
      e 2

      rcol
      
      read  -p '> Name : ' name
      blank $name      
      nm=${name%.*}
      
      name="$nm$C"
      search $HOME/.c_pro/programs/$lang/$name

    unset y 
    while [ -z $y ]; do
      n $HOME/.c_pro/programs/$lang/$name

      # removing a.out
      
       clean
      
      clear
      e 2
      col 2
      echo " ..please wait compiling programm"
      e 2
      $compiler $HOME/.c_pro/programs/$lang/$name
      stop
      error $HOME/.c_pro/programs/$lang/$name
  
      # running a.out
      clear   
      rcol
      
      ./a.out
      e 4
      col 236
      echo "press 1 to exit.."
      e 2
      stop  
     done  
    
      # renaming files 
      nm=${name%.*}
      mv a.out $nm
      
      # moving files
      mv $nm $HOME/.c_pro/output/$lang/
        
      # calling function
      check_pro

 }

 check_opt() {

  
  clear
  e 1
  rcol
  echo   "......................................................................................."
  e 1

  ls $HOME/.c_pro/output/$lang/
 
  e 1
  rcol
  echo   "......................................................................................."

  # checking output

  e 2
  rcol
  read -p '> Name : ' name
  blank $name
  search $HOME/.c_pro/output/$lang/$name

  clear
  rcol
  $HOME/.c_pro/output/$lang/./$name
  e 2
  stop

  clear
  
  check_opt
}

 manage() {

 clear
 e 1
 rcol
 echo "......................."
 rcol
 e 1
 echo "1) remove programs "

 rcol
 e 1
 echo "2) remove outputs "

 rcol
 e 1
 echo "3) edit pop file"
 rcol
 e 1 
 echo "......................."

 col 187
 read  -p '@> CHOICE : ' choice
 blank $choice

 case $choice in
 
 1) rpro ;;
 
 2) rout ;;

 3) n $HOME/.c_pro/text/$lang1 ;;
 
 *) manage ;;
 
 esac

  # calling manage
  manage 
 }
 
 rpro() {

  clear
  cd $HOME/.c_pro/programs/$lang/
  e 1
  col 238
  echo "press * to remove all"
  e 1
  rcol
  echo   "......................................................................................."
  e 1

   col 3
   ls $HOME/.c_pro/programs/$lang/
   e 1
   rcol
   echo    "......................................................................................"
   
   rcol
   e 2
   read  -p '* remove : ' a b c d e f g h i j k l m n o p q r
   blank $a
   e 1
   rm $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p $q $r
   col 14
   e 1
   echo "files successfully deleted.."
   stop
 } 


  rout() {
    
      
     clear
     cd $HOME/.c_pro/output/$lang/
     
     e 1
     col 238
     echo "press * to remove all"     
     e 1
     rcol
     echo   "...................................................................................."
     e 1

     col 3
     ls $HOME/.c_pro/output/$lang/
  
     e 1
     rcol
     echo   "...................................................................................."

     
     rcol
     e 2
     read  -p '* remove : ' a b c d e f g h i j k l m n o p q r  
     blank $a
     e 1
     rm $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p $q $r
     e 1
     col 14
     echo "files successfully deleted.."
     stop
  }


##############################

start() {
  
  clear
  rcol
  echo  "........................................ $lang ......................................"
  e 1
  rcol
  echo "1) Let's code"
  e 1
  rcol
  echo "2) Check "
  e 1
  rcol
  echo "3) Manage"
  e 1
  rcol
  echo "4) Quit"
  rcol
  e 1
  echo  "......................................................................................."

  e 1
  rcol
  read -p '> option : ' op
  blank $op
  
  case $op in
  
  1) code ;;
  
  2) check ;;
  
  3) manage ;;
  
  4) clear
     exit ;;

  c) lng $op ;;

cpp) lng $op ;;

 n) code ;;

 N) code ;;

  *) code ;;
  esac
  
  # calling start
  start 
}


 pro_test() {

   clear
   e 1
   rcol
   echo "......................................................................................."
   e 1
   
   ls $HOME/.c_pro/output/$lang/

   e 1
   rcol
   echo  "......................................................................................."

   e 2
   rcol
   read -p '> name : ' name
   blank $name

   while :
   do

   clear
   $HOME/.c_pro/output/$lang/./$name

   e 2
   stop

   unset y
   if [ ! -z $y ]
   then
    pro_test
   fi

   done
   
 }

# calling function start

clear
unset y
start

