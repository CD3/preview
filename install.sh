#! /bin/sh

PREVIEW=$(which preview 2>/dev/null)
if [[ -n $PREVIEW ]]
then
        echo "'preview' is already installed ($PREVIEW). Do you want to continue?"
        read -p "y/N: " -n 1 -r answer
        [[ -z $answer ]] && answer="N"
        if [[ $answer =~ ^[nN]$ ]]
        then
                exit 0
        fi

fi

declare -a CANDIDATES
for DIR in ${PATH//:/ }
do
        if [[ -w "$DIR" ]]
        then
                CANDIDATES+=($DIR)
        fi
done


IFS=$'\n'
SORTED_CANDIDATES=($(sort <<< "${CANDIDATES[*]}"))
unset IFS


echo "Found the following (writable) directories in your PATH."
echo "If you would like to install to a different directory, select `cancel`, add it to your PATH, and rerun."
PS3="Which directory would you like to install into? "
select item in "cancel" "${SORTED_CANDIDATES[@]}"
do
        if [[ $item == "cancel" ]]
        then
                echo "Exiting"
                 exit 1
        fi

        [[ -z $item ]] && item="$REPLY"
        
        
        if [[ -d $item ]]
        then
                if [[ -w $item ]]
                then
                        break
                else
                        echo "You do not have permissions to write to '$item'. Please select a directory from the list, or enter the name of another directory that you have permissions to write to."
                fi
        else
                echo "'$item' does not exist. Please select a directory from the list, or select cancel and create the directory before rerunning."
        fi
done
INSTALLDIR="$item"


echo "Installing 'preview' into '$INSTALLDIR'"

if [[ -e preview ]]
then
        install -m 0755 preview "$INSTALLDIR"
fi






if ! which entr > /dev/null 2>&1
then
        echo "The 'entr' command is required by 'preview', but was not found. Would you like to install it?"
        read -p "Y/n: " -n 1 -r answer
        [[ -z $answer ]] && answer="Y"
        if [[ $answer =~ ^[yY]$ ]]
        then
                echo
                tmpdir=$(mktemp -d)
                saved_dir="$PWD"
                cd $tmpdir
                echo "Downloading 'entr' source to '$tmpdir'."
                wget https://github.com/eradman/entr/archive/refs/tags/5.0.tar.gz  > /dev/null 2>&1
                tar -xzf 5.0.tar.gz
                cd entr-5.0
                ./configure
                make test
                PREFIX="$PWD" make install
                install -m 0755 bin/entr $INSTALLDIR
                cd "$saved_dir"
                echo "Installed 'entr' into '$INSTALLDIR'."
        fi
fi

exit 0
