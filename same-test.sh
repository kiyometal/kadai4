#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT () {
  echo $1 1>&2
  rm -f $tmp-*
  exit 1
}

# test1: 引数の数
echo "input 2 argments" > $tmp-arg
./same.sh 2> $tmp-ans && ERROR_EXIT "test1-1: エラー終了しない"
diff $tmp-ans $tmp-arg || ERROR_EXIT "test1-2: エラーメッセージが違う"

# test2: 自然数
echo "input natural numbers" > $tmp-nat
./same.sh a b 2> $tmp-ans && ERROR_EXIT "test2-1: エラー終了しない"
diff $tmp-ans $tmp-nat || ERROR_EXIT "test2-2: エラーメッセージが違う"

# test3: 一致
echo "1 is equal to 1" > $tmp-same
./same.sh 1 1 > $tmp-ans || ERROR_EXIT "test3-1: "
diff $tmp-ans $tmp-same || ERROR_EXIT "test3-2"

echo "0 is equal to 2" > $tmp-same
./same.sh 0 2 > $tmp-ans || ERROR_EXIT "test3-3"
diff $tmp-ans $tmp-same || ERROR_EXIT "test3-4"

rm -f $tmp-*
