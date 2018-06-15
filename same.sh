#!/bin/sh

# 引数の数チェック
if [ $# -ne 2 ]; then
  echo "input 2 argment" 1>&2
  exit 1
fi
# 自然数かどうかチェック
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
  echo "input natural number" 1>&2
  exit 1
fi

# 一致
if [ $1 -eq $2 ]; then
  echo "$1 is equal to $2"
else
  echo "$1 is not equal to $2"
fi

