#!/bin/bash
rm -rf out
mkdir out
./replace.rb dane.txt bez_danych.lp out/z_danymi.lp
./replace.rb dane.txt bez_danych2.lp out/z_danymi2.lp
