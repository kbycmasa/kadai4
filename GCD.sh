#!/bin/sh

a=$1
b=$2

if [ $# -ne 2 ]; then
    echo "error: Two arguments are required."
    exit 1
fi

case "$1$2" in
    *[!0-9]*)
        echo "error: The argument is not an integer."
        exit 1
        ;;
esac

for n in "$1" "$2"
do
    echo "$n" | grep -Eq '^[0-9]{1,18}$' || {
        echo "Please enter an integer of 18 digits or less."
        exit 1
    }
done

if [ "$1" -eq 0 ] && [ "$2" -eq 0 ]; then
    echo "error: 0 cannot be specified."
    exit 1
fi


while [ $b -ne 0 ]
do
    r=$(($a % $b))
    a=$b
    b=$r
done

echo $a

