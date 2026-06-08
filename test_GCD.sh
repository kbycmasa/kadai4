#!/bin/sh

SCRIPT=./GCD.sh

# 正常系テスト
check() {
    result=$($SCRIPT "$1" "$2")
    expected=$3

    if [ "$result" = "$expected" ]; then
        echo "OK: gcd($1,$2)=$result"
    else
        echo "NG: gcd($1,$2) expected=$expected actual=$result"
        exit 1
    fi
}

# 異常系テスト
check_error() {
    $SCRIPT "$@" >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "OK: error detected"
    else
        echo "NG: error expected"
        exit 1
    fi
}

# 正常系
check 12 18 6
check 36 48 12
check 155 3 1
check 100 25 25
check 7 7 7

# 異常系
check_error
check_error 12
check_error abc 12
check_error 12 abc
check_error 0 0
check_error 1234567890123456789 1

echo "All tests passed."

