#!/bin/bash
function color {
  echo -e "\e[31m$1\e[0m"
}
./replace.sh
lp_solve -v out/z_danymi.lp
color "--------------------------------------------------------------------------------"
lp_solve -v out/z_danymi2.lp
